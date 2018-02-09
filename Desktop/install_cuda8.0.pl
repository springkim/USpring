#!/usr/bin/perl
#  Desktop/install_cuda8.0.pl
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
system "sudo apt-get install linux-headers-$(uname -r)";
#Download & Install CUDA-8.0.61
chdir "/tmp/";
system "curl -L https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb -o /tmp/cuda.deb";
system "sudo dpkg -i cuda.deb";
system "sudo apt-get update -y";
system "sudo apt-get install cuda -y";
unlink "cuda.deb";
#Download & Install Patch2(cuBLAS patch update to CUDA 8 at 2017.06.26)
system "curl -L https://developer.nvidia.com/compute/cuda/8.0/Prod2/patches/2/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb -o /tmp/cuda-patch2.deb";
system "sudo dpkg -i cuda-patch2.deb";
#Link cuda directories
open FP,">>",$ENV{"HOME"}."/.bashrc";
print FP "\n\n";
print FP 'export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}'."\n";
print FP 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}'."\n";
close FP;



