#!/usr/bin/perl
#  Desktop/install_opencv.pl
#  USpring
#
#  Created by kimbom on 2017. 9. 22...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
#Install dependencies
my $cmd="sudo apt-get install -y
curl
git
cmake
build-essential
pkg-config
libjpeg-dev
libtiff5-dev
libjasper-dev
libpng12-dev
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
";
$cmd=~s/\n/ /g;
system $cmd;
#Purge OpenCV
system "sudo rm -r /usr/include/opencv/" if(-d "/usr/include/opencv/");
system "sudo rm -r /usr/include/opencv2/" if(-d "/usr/include/opencv2/");
system "sudo rm /usr/lib/*opencv*";
#Download OpenCV3.X
chdir "/tmp";
mkdir "opencv";
chdir "opencv";
system "git clone https://github.com/opencv/opencv";
system "git clone https://github.com/RLovelett/eigen";
system "git clone https://github.com/opencv/opencv_contrib";
my @world=("OFF","ON");
my @contrib=("-DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules","");
for(my $i=0;$i<2;$i++){
	system "sudo rm -r build" if(-d "build");
	mkdir "build";
	chdir "build";
#Build OpenCV3.X
	$cmd = "cmake ../opencv
	-DCMAKE_BUILD_TYPE=RELEASE
	-DCMAKE_INSTALL_PREFIX=build
	-DBUILD_DOCS=OFF
	-DBUILD_TESTS=OFF
	-DBUILD_PERF_TESTS=OFF
	-DBUILD_PACKAGE=OFF
	-DBUILD_IPP_IW=OFF
	-DBUILD_OPENMP=OFF
	-DBUILD_SHARED_LIBS=ON
	-DEIGEN_INCLUDE_PATH=../eigen
	-DWITH_CUDA=OFF
	-DWITH_OPENCL=OFF
	-DBUILD_opencv_python=OFF
	-DBUILD_opencv_world=$world[$i]
	@contrib[$i]
	";
	$cmd=~s/\n/ /g;
	system $cmd;
	system "make -j2";
	system "make install";
	chdir "build";
#Install OpenCV3.X
	system "sudo cp -r include/opencv /usr/include/" if($i==0);
	system "sudo cp -r include/opencv2 /usr/include/" if($i==0);
	system "sudo cp lib/lib* /usr/lib/";
	chdir "../../";
}
#Install OpenCV for Python2
system "pip2 install opencv-python";
#Install OpenCV for Python3
system "pip3 install opencv-python";
#Remove build files
chdir "..";
system "sudo rm -r opencv/";
