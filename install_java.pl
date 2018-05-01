#!/usr/bin/perl
#  Desktop/install_java.pl
#  USpring
#
#  Created by kimbom on 2017. 08. 22...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);
system "sudo ls >/tmp/nul";
my @arr=`lsb_release -a` =~ /^Release:\s+(.+)$/m;
if($arr[0] eq "18.04"){
	system "sudo apt-get install openjdk-11-jdk -y";
}else{
	system "sudo apt-get install openjdk-9-jdk -y";
	system "sudo dpkg --configure -a";
	system 'sudo dpkg -i --force-overwrite \'/var/cache/apt/archives/openjdk-9-jdk_9~b114-0ubuntu1_amd64.deb\'';

	system "sudo apt-get install openjdk-9-jdk -y";
}
