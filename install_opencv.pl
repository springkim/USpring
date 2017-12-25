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
die "Please run as not superuser" if($<==0);
system "sudo apt-get install curl -y";

say "opencv downloading...";
system "mkdir opencv";
chdir("opencv");
system "curl -L https://github.com/opencv/opencv/archive/3.3.0.zip -o opencv-3.3.0.zip";
system "unzip opencv-3.3.0.zip";
system "chmod -R 777 opencv-3.3.0";
system "sudo apt-get install cmake -y";
system "sudo apt-get install build-essential cmake pkg-config libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev libx264-dev libxine2-dev libv4l-dev v4l-utils libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libqt4-dev mesa-utils libgl1-mesa-dri libqt4-opengl-dev libatlas-base-dev gfortran libeigen3-dev python2.7-dev python3-dev python-numpy python3-numpy -y";

system "mkdir build";
chdir("build");
system "cmake ../opencv-3.3.0 -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=build -DWITH_TBB=ON -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_opencv_world=OFF -DWITH_CUDA=ON -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF";
# make -j? is build with ? cpu cores.
system "make -j`cat /proc/cpuinfo | grep cores | wc -l`";
system "make install";
chdir("build");
#for c++(usually it will be using other library)
system "sudo cp -r include/opencv /usr/include/";
system "sudo cp -r include/opencv2 /usr/include/";
system "sudo cp lib/lib* /usr/lib/";
#for python2.7
system "sudo cp lib/python2.7/dist-packages/* /usr/local/lib/python2.7/dist-packages/";
#for python3.5
system "sudo cp lib/python3.5/dist-packages/* /usr/local/lib/python3.5/dist-packages/";
chdir("..");
################
# opencv world #
################
system "cmake ../opencv-3.3.0 -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=build -DWITH_TBB=ON -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_opencv_world=ON -DWITH_CUDA=ON -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF";
# make -j? is build with ? cpu cores.
system "make -j`cat /proc/cpuinfo | grep cores | wc -l`";
system "make install";
chdir("build");
#for c++ programming
system "sudo cp -r include/opencv /usr/include/";
system "sudo cp -r include/opencv2 /usr/include/";
system "sudo cp lib/lib* /usr/lib/";

chdir("../../../");
system "sudo rm -r opencv";

say "install finished!";
say "You can compile opencv project as \"g++ main.cpp -lopencv_world\"";

