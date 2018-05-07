#!/usr/bin/perl
#  Desktop/install_cuda9.0.pl
#  USpring
#
#  Created by kimbom on 2018. 05. 08...
#  Copyright 2018 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
#Install dependencies
my @arr=`lsb_release -a 2> /tmp/nul` =~ /^Release:\s+(.+)$/m;
if($arr[0] eq "18.04"){
	die "Can not install cuda9.0 on ubuntu 18.04\n";
}elsif($arr[0] eq "16.04"){
	#Remove other cuda
	system "sudo apt-get remove cuda-* -y";
	#Install dependencies
	system 'sudo apt-get install linux-headers-$(uname -r)';
	system "sudo apt-get install curl -y";
	#Download & Install CUDA-9.1
	chdir "/tmp/";
	system "curl -L https://www.dropbox.com/s/x3w7kzz4nquw395/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb?dl=1 -o /tmp/cuda.deb";
	system "sudo dpkg -i cuda.deb";
	system "sudo apt-get update -y";
	system "sudo apt-get install cuda -y";
	unlink "cuda.deb";
	#Download & Install Patch 1 (Released Jan 25, 2018) 
	system "curl -L https://www.dropbox.com/s/5fpwlvnc5pq0mno/cuda-repo-ubuntu1604-9-0-local-cublas-performance-update_1.0-1_amd64.deb?dl=1 -o cuda-patch1.deb";
	system "sudo dpkg -i cuda-patch1.deb";
	unlink "cuda-patch1.deb";
	#Download & Install Patch 2 (Released Mar 5, 2018) 
	system "curl -L https://www.dropbox.com/s/91xs4fcox19mth7/cuda-repo-ubuntu1604-9-0-local-cublas-performance-update-2_1.0-1_amd64.deb?dl=1 -o cuda-patch2.deb";
	system "sudo dpkg -i cuda-patch2.deb";
	unlink "cuda-patch2.deb";
	#Link cuda directories
	open FP,">>",$ENV{"HOME"}."/.bashrc";
	print FP "\n\n";
	print FP 'export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}'."\n";
	print FP 'export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}'."\n";
	close FP;
}
