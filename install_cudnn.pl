#!/usr/bin/perl
#  Desktop/install_cudnn(picker).pl
#  USpring
#
#  Created by kimbom on 2019. 12. 21...
#  Copyright 2019 kimbom. All rights reserved.
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
#Select PyCharm tar.gz file
my $result=`zenity --file-selection --file-filter='tgz files (tgz) | *.tgz'`;
print($result);
system "tar xvzf $result";

if(-d '/usr/local/cuda/include'){
	system "sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include";
	system "sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64";
	system "sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*";
}else{
	system "sudo cp -P cuda/include/cudnn.h /usr/include";
	system "sudo cp -P cuda/lib64/libcudnn* /usr/bin";
	system "sudo chmod a+r /usr/include/cudnn.h /usr/bin/libcudnn*";
}
#Remove all install files.
system "sudo rm -r cuda";
