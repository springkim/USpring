#!/usr/bin/perl
#  Desktop/install_cudnn7.pl
#  USpring
#
#  Created by kimbom on 2018. 02. 09...
#  Copyright 2018 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
sub GetCudaVersion(){
	my @ver=`nvcc -V` =~ /release (.+),/m;
	return $ver[0];
}
#Check root
die "Please run as not superuser" if($<==0);
#Install dependencies
system "sudo apt-get install libcupti-dev -y";
#Download CUDNN
chdir "/tmp/";
my $ver=GetCudaVersion;
if($ver eq "9.1"){
	system "curl -L https://github.com/springkim/USpring/releases/download/cudnn7%2C1/cudnn-9.1-linux-x64-v7.1.tgz -o cudnn.tgz";
}elsif($ver eq "9.0"){
	system "curl -L https://github.com/springkim/USpring/releases/download/cudnn7%2C1/cudnn-9.0-linux-x64-v7.1.tgz -o cudnn.tgz";
}elsif($ver eq "8.0"){
	system "curl -L https://github.com/springkim/USpring/releases/download/cudnn7%2C1/cudnn-8.0-linux-x64-v7.1.tgz -o cudnn.tgz";
}else{
	die "No cuda";
}
system "tar xvzf cudnn.tgz";

system "sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include";
system "sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64";
system "sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*";

#Remove all install files.
unlink "cudnn.tgz";
system "sudo rm -r cuda";
