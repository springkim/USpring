#!/usr/bin/perl
#  Desktop/install_caffe.pl
#  USpring
#
#  Created by kimbomm on 2018. 02. 09...
#  Copyright 2018 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
#Install dependencies
my $cmd="sudo apt-get install -y
build-essential
cmake
git
pkg-config
libprotobuf-dev
libleveldb-dev
libsnappy-dev
libhdf5-serial-dev
protobuf-compiler
libatlas-base-dev
--no-install-recommends libboost-all-dev
libgflags-dev
libgoogle-glog-dev
liblmdb-dev
python2.7-dev
python3-dev
python-numpy
python3-numpy
python-pip
python3-pip
python-scipy
python3-scipy
";
$cmd=~s/\n/ /g;
system $cmd;
system "sudo -H pip install --upgrade pip";
#Download caffe
chdir "/tmp/";
system "git clone https://github.com/BVLC/caffe";
system "curl -L https://github.com/springkim/USpring/releases/download/caffe/Makefile.config -o /tmp/caffe/Makefile.config";
#Build caffe
chdir "caffe";
chdir "python";
system "pip2 install -r requirements.txt";
system "pip3 install -r requirements.txt";
chdir "..";
system "make all -j2";
system "make test && make runtest";
system "make pycaffe && make distribute";
chdir "..";

#Install caffe for C/C++
system "sudo cp -r caffe/distribute/include/caffe /usr/include/";
system "sudo cp caffe/distribute/lib/* /usr/lib/";
#Install caffe for python 2.7

system "sudo mkdir /usr/local/lib/python2.7/site-packages/" unless(-d '/usr/local/lib/python2.7/site-packages/');
system "sudo cp -r caffe/distribute/python/caffe /usr/local/lib/python2.7/dist-packages/";
#Install caffe for python 3.5
system "sudo mkdir /usr/local/lib/python3.5/site-packages/" unless(-d '/usr/local/lib/python3.5/site-packages/');
system "sudo cp -r caffe/distribute/python/caffe /usr/local/lib/python3.5/dist-packages/";

#Remove installation file
system "sudo rm -r caffe";
