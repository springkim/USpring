#!/usr/bin/perl
#  Desktop/install_cuda10.0.pl
#  USpring
#
#  Created by kimbomm on 2019. 12. 21...
#  Copyright 2019 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
#Install CUDA10.0
#[16.04][18.04-19.10]
my @cuda_url=("https://github.com/springkim/USpring/releases/download/cuda/cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb","https://github.com/springkim/USpring/releases/download/cuda/cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64.deb");
my @cuda_patch1_url=("https://github.com/springkim/USpring/releases/download/cuda/cuda-repo-ubuntu1604-10-0-local-nvjpeg-update-1_1.0-1_amd64.deb","https://github.com/springkim/USpring/releases/download/cuda/cuda-repo-ubuntu1804-10-0-local-nvjpeg-update-1_1.0-1_amd64.deb");
my @arr=`lsb_release -a 2> /tmp/nul` =~ /^Release:\s+(.+)$/m;

my $veridx=-1;
$veridx=0 if($arr[0] >= 16.04 and $arr[0] <=16.10);
$veridx=1 if($arr[0] >= 18.04 and $arr[0] <=19.10);

#Remove other cuda
system "sudo apt-get remove cuda-* -y";
#Download & Install CUDA-10.0
system "sudo apt-get install curl -y";
chdir "/tmp/";
system "curl -L $cuda_url[$veridx] -o /tmp/cuda.deb";
system "sudo dpkg -i cuda.deb";
system "sudo apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub";
unlink "cuda.deb";

#Download & Install Patch 1 (Released May 10, 2019)
system "curl -L $cuda_patch1_url[$veridx] -o cuda-patch1.deb";
system "sudo dpkg -i cuda-patch1.deb";
unlink "cuda-patch1.deb";

##Install CUDA10.0
system "sudo apt-get update -y";
system "sudo apt-get install cuda -y";
#Link cuda directories
open FP,">>",$ENV{"HOME"}."/.bashrc";
print FP "\n\n";
print FP 'export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}'."\n";
print FP 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}'."\n";
close FP;
