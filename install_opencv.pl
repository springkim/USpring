#!/usr/bin/perl
#  install_opencv.pl
#  USpring
#
#  Created by kimbom on 2017. 9. 22...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "This script must be run as root" if($<!=0);
say "opencv downloading...";
system "mkdir opencv";
chdir("opencv");
system "wget https://www.dropbox.com/s/sklfonyrw9g6ehz/opencv-3.3.0.zip?dl=1 -O opencv-3.3.0.zip";
system "unzip opencv-3.3.0.zip";
system "chmod -R 777 opencv-3.3.0";
system "apt-get install cmake -y";
system "apt-get install build-essential cmake pkg-config libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev libx264-dev libxine2-dev libv4l-dev v4l-utils libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libqt4-dev mesa-utils libgl1-mesa-dri libqt4-opengl-dev libatlas-base-dev gfortran libeigen3-dev python2.7-dev python3-dev python-numpy python3-numpy -y";

system "mkdir build";
chdir("build");
system "cmake ../opencv-3.3.0 -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=build -DWITH_TBB=ON -DBUILD_opencv_world=ON";
# make -j? is build with ? cpu cores.
system "make -j`cat /proc/cpuinfo | grep cores | wc -l`";
system "make install";
chdir("build");
system "cp -r include/opencv /usr/include/";
system "cp -r include/opencv2 /usr/include/";
system "cp lib/lib* /usr/lib/";
chdir("../../../");
system "rm -r opencv";

say "install finished!";
say "You can compile opencv project as \"g++ main.cpp -lopencv_world\"";

