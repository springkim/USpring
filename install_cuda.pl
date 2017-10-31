#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);
#Check root
die "This script must be run as root" if($<!=0);

system "apt-get install linux-headers-$(uname -r)";

system "wget https://www.dropbox.com/s/87rb1q3bgsfpehc/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb?dl=0 -O cuda.deb";
system "dpkg -i cuda.deb";
system "apt-get update -y";
system "apt-get install cuda -y";
unlink "cuda.deb";
open FP,">>",$ENV{"HOME"}."/.bashrc";
print FP "\n\n";
print FP 'export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}'."\n";
print FP 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}'."\n";




