#!/usr/bin/perl
#  Desktop/install_cuda9.1.pl
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
	#It install cuda 9.1 only on ubuntu 18.04
	system "sudo apt install nvidia-cuda-toolkit -y";
	system "sudo chmod 647 /usr/include/crt/host_config.h";
	open FP,"<","/usr/include/crt/host_config.h";
	my $data=do{
	    local $/=undef;
	    <FP>;
	};
	close FP;
	$data=~s/#error -- unsupported GNU version! gcc versions later than 6 are not supported!/\/\/#error -- unsupported GNU version! gcc versions later than 6 are not supported!/;
	open FP,">","/usr/include/crt/host_config.h";
	print FP $data;
	close FP;
	system "sudo chmod 644 /usr/include/crt/host_config.h";
}elsif($arr[0] eq "16.04"){
	#Remove other cuda
	system "sudo apt-get remove cuda-* -y";
	#Install dependencies
	system 'sudo apt-get install linux-headers-$(uname -r)';
	system "sudo apt-get install curl -y";
	#Download & Install CUDA-9.1
	chdir "/tmp/";
	system "curl -L https://www.dropbox.com/s/kxl9mlezemgla0o/cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64.deb?dl=1 -o /tmp/cuda.deb";
	system "sudo dpkg -i cuda.deb";
	system "sudo apt-get update -y";
	system "sudo apt-get install cuda -y";
	unlink "cuda.deb";
	#Download & Install Patch 1 (Released Jan 25, 2018)
	system "curl -L https://www.dropbox.com/s/x6iln2q6ft9f5jz/cuda-repo-ubuntu1604-9-1-local-cublas-performance-update-1_1.0-1_amd64.deb?dl=1 -o cuda-patch1.deb";
	system "sudo dpkg -i cuda-patch1.deb";
	unlink "cuda-patch1.deb";
	#Download & Install Patch 2 (Released Feb 27, 2018)
	system "curl -L https://www.dropbox.com/s/w0oul0gn33yqx9u/cuda-repo-ubuntu1604-9-1-local-compiler-update-1_1.0-1_amd64.deb?dl=1 -o cuda-patch2.deb";
	system "sudo dpkg -i cuda-patch2.deb";
	unlink "cuda-patch2.deb";
	#Download & Install Patch 3 (Released Mar 5, 2018)
	system "curl -L https://www.dropbox.com/s/2bmktfhzmiahsx9/cuda-repo-ubuntu1604-9-1-local-cublas-performance-update-3_1.0-1_amd64.deb?dl=1 -o cuda-patch3.deb";
	system "sudo dpkg -i cuda-patch3.deb";
	unlink "cuda-patch3.deb";
	#Link cuda directories
	open FP,">>",$ENV{"HOME"}."/.bashrc";
	print FP "\n\n";
	print FP 'export PATH=/usr/local/cuda-9.1/bin${PATH:+:${PATH}}'."\n";
	print FP 'export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}'."\n";
	close FP;
}
