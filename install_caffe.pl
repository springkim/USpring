#!/usr/bin/perl
#  install_caffe.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 1...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);

#Prepare to caffe
system "sudo apt-get install -y build-essential cmake git pkg-config libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler libatlas-base-dev";
system "sudo apt-get install -y --no-install-recommends libboost-all-dev";
system "sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev";

system "sudo apt-get install -y python-pip";
system "sudo apt-get install -y python-dev";
system "sudo apt-get install -y python-numpy python-scipy";

#download caffe
system "wget https://www.dropbox.com/s/zxmk0cz9o53y2as/caffe.zip?dl=1 -O caffe.zip";
system "unzip caffe.zip";
#make caffe
chdir "caffe";
system 'make all -j $(($(nproc) + 1))';
system "make test && make runtest";
system "make pycaffe && make distribute";
chdir "..";

#Install caffe for C/C++
system "sudo cp -r caffe/distribute/include/caffe /usr/include/";
system "sudo cp caffe/distribute/lib/* /usr/lib/";
#Install caffe for python 2.7
system "sudo mkdir /usr/local/lib/python2.7/site-packages/";
system "sudo cp -r caffe/distribute/python/caffe /usr/local/lib/python2.7/dist-packages/";
#Install caffe for python 3.5
system "sudo mkdir /usr/local/lib/python3.5/site-packages/";
system "sudo cp -r caffe/distribute/python/caffe /usr/local/lib/python3.5/dist-packages/";

#Remove installation file
system "sudo rm -r caffe";
system "sudo rm caffe.zip";
