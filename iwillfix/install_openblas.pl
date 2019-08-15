#!/usr/bin/perl
#  Desktop/install_openblas.pl
#  USpring
#
#  Created by kimbomm on 2018. 05. 02...
#  Copyright 2018 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw/say/;
#Check root
die "Please run as not superuser" if($<==0);
chdir "/tmp/";
system "sudo apt-get install gfortran -y";
system "sudo rm -r build_openblas" if(-d "build_openblas");
mkdir "build_openblas";
chdir "build_openblas";
system "git clone https://github.com/xianyi/OpenBLAS";
mkdir "build";
chdir "build";
my $cmd="cmake ../OpenBLAS
-DCMAKE_BUILD_TYPE=RELEASE
-DCMAKE_INSTALL_PREFIX=build
-DUSE_THREAD=0
";
$cmd=~s/\n/ /g;
system $cmd;
system "make -j2";
system "make install";
system "sudo cp build/lib/*openblas* /usr/lib/";
system "sudo cp build/include/* /usr/include/";
#pkg-config
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
my $file="build/lib/pkgconfig/openblas.pc";
my $pkg_config=F2S($file);
$pkg_config=~s/libdir=.*/libdir=\/usr\/lib/;
$pkg_config=~s/includedir=.*/includedir=\/usr\/include/;
open FP,'>',$file;
print FP $pkg_config;
close FP;
system "sudo cp $file /usr/lib/pkgconfig/openblas.pc";
