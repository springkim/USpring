#!/usr/bin/perl
#  install_java.pl
#  USpring
#
#  Created by kimbom on 2017. 8. 22...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "This scripr must be run as root" if($<!=0);

system "apt-get install openjdk-9-jdk -y";
system "dpkg --configure -a";
system 'dpkg -i --force-overwrite \'/var/cache/apt/archives/openjdk-9-jdk_9~b114-0ubuntu1_amd64.deb\'';

system "apt-get install openjdk-9-jdk -y";