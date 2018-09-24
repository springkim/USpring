#!/usr/bin/perl
#  Desktop/install_cuda9.0.pl
#  USpring
#
#  Created by kimbomm on 2018. 05. 08...
#  Copyright 2018 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
#Install CUDA9.0
#[16.04][18.04]
my @cuda_url=("https://github.com/springkim/USpring/releases/download/16.04/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb","https://github.com/springkim/USpring/releases/download/18.04/cuda-repo-ubuntu1704-9-0-local_9.0.176-1_amd64.deb");
my @cuda_patch1_url=("https://github.com/springkim/USpring/releases/download/16.04/cuda-repo-ubuntu1604-9-0-local-cublas-performance-update_1.0-1_amd64.deb","https://github.com/springkim/USpring/releases/download/18.04/cuda-repo-ubuntu1704-9-0-local-cublas-performance-update_1.0-1_amd64.deb");
my @cuda_patch2_url=("https://github.com/springkim/USpring/releases/download/16.04/cuda-repo-ubuntu1604-9-0-local-cublas-performance-update-2_1.0-1_amd64.deb","https://github.com/springkim/USpring/releases/download/18.04/cuda-repo-ubuntu1704-9-0-local-cublas-performance-update-2_1.0-1_amd64.deb");
my @arr=`lsb_release -a 2> /tmp/nul` =~ /^Release:\s+(.+)$/m;

my $veridx=-1;
$veridx=0 if($arr[0] eq "16.04");
$veridx=1 if($arr[0] eq "18.04");

#Remove other cuda
system "sudo apt-get remove cuda-* -y";
#Download & Install CUDA-9.0
system 'sudo apt-get install linux-headers-$(uname -r)' if($arr[0] eq "16.04");
system "sudo apt-get install curl -y";
chdir "/tmp/";
system "curl -L $cuda_url[$veridx] -o /tmp/cuda.deb";
system "sudo dpkg -i cuda.deb";
system "sudo apt-key add /var/cuda-repo-9.0/7fa2af80.pub" if($arr[0] eq "18.04");
unlink "cuda.deb";

#Download & Install Patch 1 (Released Jan 25, 2018)
system "curl -L $cuda_patch1_url[$veridx] -o cuda-patch1.deb";
system "sudo dpkg -i cuda-patch1.deb";
unlink "cuda-patch1.deb";

#Download & Install Patch 2 (Released Mar 5, 2018)
system "curl -L $cuda_patch2_url[$veridx] -o cuda-patch2.deb";
system "sudo dpkg -i cuda-patch2.deb";
system "sudo apt-key add /var/cuda-repo-9-0-local-cublas-performance-update-2/7fa2af80.pub" if($arr[0] eq "18.04");
system "sudo apt-get update -y";
unlink "cuda-patch2.deb";

##Install CUDA9.0
system "sudo apt-get update -y";
system "sudo apt-get install cuda -y";
#Link cuda directories
open FP,">>",$ENV{"HOME"}."/.bashrc";
print FP "\n\n";
print FP 'export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}'."\n";
print FP 'export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}'."\n";
close FP;

if($arr[0] eq "18.04"){
	system "sudo chmod 647 /usr/local/cuda-9.0/include/crt/host_config.h";
	open FP,"<","/usr/local/cuda-9.0/include/crt/host_config.h";
	my $data=do{
	    local $/=undef;
	    <FP>;
	};
	close FP;
	$data=~s/#error -- unsupported GNU version! gcc versions later than 6 are not supported!/\/\/#error -- unsupported GNU version! gcc versions later than 6 are not supported!/;
	open FP,">","/usr/local/cuda-9.0/include/crt/host_config.h";
	print FP $data;
	close FP;
	system "sudo chmod 644 /usr/local/cuda-9.0/include/crt/host_config.h";
}
