#!/usr/bin/perl
#  Desktop/install_cuda10.1.pl
#  USpring
#
#  Created by kimbomm on 2020. 03. 04...
#  Copyright 2020 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
#Install CUDA10.1
#[18.04-19.10]
my $cuda_url=("https://github.com/springkim/USpring/releases/download/cuda/cuda-repo-ubuntu1804-10-1-local-10.1.105-418.39_1.0-1_amd64.deb");

#Remove other cuda
system "sudo apt-get remove cuda-* -y";
#Download & Install CUDA-10.1
system "sudo apt-get install curl -y";
chdir "/tmp/";
system "curl -L $cuda_url -o /tmp/cuda.deb";
system "sudo dpkg -i cuda.deb";
system "sudo apt-key add /var/cuda-repo-10-1-local-10.1.105-418.39/7fa2af80.pub";
unlink "cuda.deb";
##Install CUDA10.1
system "sudo apt-get update -y";
system "sudo apt-get install cuda -y";
#Link cuda directories
open FP,">>",$ENV{"HOME"}."/.bashrc";
print FP "\n\n";
print FP 'export PATH=/usr/local/cuda-10.1/bin${PATH:+:${PATH}}'."\n";
print FP 'export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}'."\n";
close FP;
