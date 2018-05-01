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
}
