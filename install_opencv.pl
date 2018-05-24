#!/usr/bin/perl
#  Desktop/install_opencv.pl
#  USpring
#
#  Created by kimbom on 2018. 04. 20...
#  Copyright 2018 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw/say/;
use WWW::Mechanize;
use File::Find qw/finddepth/;
use File::Path qw/mkpath/;
use File::Copy;
use List::MoreUtils qw/first_index/;
#Check root
die "Please run as not superuser" if($<==0);
my $requirements="sudo apt-get install -y
curl
git
cmake
build-essential
pkg-config
libjpeg-dev
libtiff5-dev
libavcodec-dev
libavformat-dev
libswscale-dev
libxvidcore-dev
libx264-dev
libxine2-dev
libv4l-dev
v4l-utils
libgstreamer1.0-dev
libgstreamer-plugins-base1.0-dev
libqt4-dev
mesa-utils
libgl1-mesa-dri
libqt4-opengl-dev
libatlas-base-dev
gfortran
libeigen3-dev
python2.7-dev
python3-dev
python-numpy
python3-numpy
python-pip
python3-pip
mercurial
";
my @arr=`lsb_release -a  2> /tmp/nul` =~ /^Release:\s+(.+)$/m;
if($arr[0] eq "16.04"){
	$requirements.="libpng12-dev libjasper-dev";
}
$requirements=~s/\n/ /g;
system $requirements;


chdir "/tmp/";
sub OpenCVUrl($){
	my $ver=shift;
	die if ($ver<2 or $ver>4);
	my $mech = WWW::Mechanize->new();
	my @urls = ("https://github.com/opencv/opencv/releases");
	push @urls,"https://github.com/opencv/opencv_contrib/releases" if($ver==3);
	my @ret;
	foreach my $url(@urls){
		$mech->get($url);
		my @links = $mech->links();
		my @href;
		($_->url=~m!archive/$ver.*\.zip!) and push @href,$_->url foreach(@links);
		@href=reverse sort @href;
		push @ret,"https://github.com".$href[0];
	}
	return @ret;
}
my @names;
mkdir "opencv" unless(-d "opencv");
chdir "opencv";

`curl --silent -L $_ -O -J` or push @names,$_ foreach OpenCVUrl(2);
`curl --silent -L $_ -O -J` or push @names,$_ foreach OpenCVUrl(3);
`unzip opencv-2*`;
`unzip opencv-3*`;
`unzip opencv_contrib-3*`;
`hg clone https://bitbucket.org/eigen/eigen/`;
`rm *.zip`;
mkdir "build2";
mkdir "build3";

$_ = substr $_,rindex($_,"/")+1,rindex($_,".")-rindex($_,"/")-1foreach(@names);

#opencv2 , opencv3-contrib , opencv3-world
my @ver=(2,3,3);
my @dir=("build2","build3c","build3w");
my @op_eigen=("","-DEIGEN_INCLUDE_PATH=../eigen","-DEIGEN_INCLUDE_PATH=../eigen");
my @op_world=("","-DBUILD_opencv_world=OFF","-DBUILD_opencv_world=ON");
my @op_contrib=("","-DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-$names[2]/modules","");

foreach my $i(0..2){
	mkdir $dir[$i] unless(-d $dir[$i]);
	chdir $dir[$i];
	my $cmd="cmake ../opencv-$ver[$i]*
	-DCMAKE_BUILD_TYPE=RELEASE
	-DCMAKE_INSTALL_PREFIX=build
	-DBUILD_DOCS=OFF
	-DBUILD_TESTS=OFF
	-DBUILD_PERF_TESTS=OFF
	-DBUILD_PACKAGE=OFF
	-DBUILD_IPP_IW=OFF
	-DBUILD_OPENMP=OFF
	-DBUILD_SHARED_LIBS=ON
	-DWITH_CUDA=OFF
	-DWITH_OPENCL=OFF
	-DBUILD_opencv_python=OFF
	$op_eigen[$i]
	$op_world[$i]
	$op_contrib[$i]
	";
	$cmd=~s/\n/ /g;
	system $cmd;
	system "make -j2";
	system "make install";
	chdir "..";
}
# Copy lib to /usr/lib/
foreach my $i(0..2){
	chdir $dir[$i]."/build";
	if($i==0){
		chdir "lib";
		my @files;
		finddepth(sub {
		 	return if($_ eq '.' || $_ eq '..' ||-d $_);
		 	push @files, $File::Find::name;
		}, ".");
		my $ver=$names[0];
		my @libs;
		while(scalar(@libs)==0){
			foreach my $file(@files){
				if($file=~/$ver/){
					push @libs,$file;
				}
			}
			$ver=substr($ver,0,rindex($ver,"."));
		}
		foreach my $file(@libs){
			my $dst=substr($file,0,index($file,".so"))."C.so";
			system "ln -s $file $dst";
		}
		chdir "..";
	}
	#lib(link file without version name) of 2.x opencv will removed!
	#Instead we are using libopencv*C.so for gcc and pkg-config
	system "sudo cp lib/lib* /usr/lib/";
	chdir "../..";
}

# Make general include folder
my @files2;
my @files3;
foreach my $i(0..1){
	chdir $dir[$i]."/build";
	my @files;
	finddepth(sub {
	 	return if($_ eq '.' || $_ eq '..' ||-d $_);
	 	push @files, $File::Find::name;
	}, 'include');
	#$_=$dir[$i]."/build/".$_ foreach(@files);
	@files2=@files if($i==0);
	@files3=@files if($i==1);
	chdir "../..";
}
sub F2S($){
	my $file = shift;
	my $document = do {
	    local $/ = undef;
	    open my $fh, "<", $file
	        or die "could not open $file: $!";
	    <$fh>;
	};
	return $document;
}
foreach my $file2(@files2){
	my $dir=substr($file2,0,rindex($file2,"/"));
	mkpath $dir,0,0777;
	my $idx=first_index {$_ eq $file2} @files3;
	open FP,'>',$file2;
	print FP "#ifndef __cplusplus\n";
	print FP F2S($dir[0]."/build/".$file2)."\n";
	print FP "#else\n";
	print FP F2S($dir[1]."/build/".$files3[$idx])."\n" if($idx!=-1);
	print FP "#endif\n";
	close FP;
	$files3[$idx]="" if($idx!=-1);
}
foreach my $file3(@files3){
	my $dir=substr($file3,0,rindex($file3,"/"));
	mkpath $dir,0,0777;
	copy $dir[1]."/build/".$file3,$file3 if($file3 ne "");
}
system "sudo cp -r include/opencv /usr/include/";
system "sudo cp -r include/opencv2 /usr/include/";

# Make pkg-config file
foreach my $i(0..1){
	my $file=$dir[$i]."/build/lib/pkgconfig/opencv.pc";
	my $pkg_config=F2S($file);
	$pkg_config=~s/prefix=.*/prefix=\/usr/;
	if($i==0){
		my @libs = $pkg_config =~ /-lopencv_[0-9a-zA-Z_]+/g;
		foreach(@libs){
			unless($_=~/opencv_ts/){
				my $dst=$_."C";
				$pkg_config=~s/$_/$dst/
			}
		}
	}
	open FP,'>',$file;
	print FP $pkg_config;
	close FP;
	my $ver=$i+2;
	`sudo cp $file /usr/lib/pkgconfig/opencv$ver.pc`;
	`sudo cp $file /usr/lib/pkgconfig/opencv.pc` if($i==1);
}
chdir "..";
system "sudo rm -r opencv";

#Install OpenCV for Python2
system "pip2 install opencv-python";
#Install OpenCV for Python3
system "pip3 install opencv-python";
