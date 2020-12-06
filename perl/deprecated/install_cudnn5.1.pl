#!/usr/bin/perl
#  Desktop/install_cudnn5.1.pl
#  USpring
#
#  Created by kimbom on 2018. 02. 09...
#  Copyright 2018 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
#Install dependencies
system "sudo apt-get install libcupti-dev -y";
#Download CUDNN
chdir "/tmp/";
system "curl -L https://www.dropbox.com/s/abqyn238m4d6rcl/cudnn-8.0-linux-x64-v5.1.tgz?dl=1 -o cudnn.tgz";
system "tar xvzf cudnn.tgz";
system "sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include";
system "sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64";
system "sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*";
#Remove all install files.
unlink "cudnn.tgz";
system "sudo rm -r cuda";
