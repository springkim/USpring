#!/usr/bin/perl
#  Desktop/install_hancom_viewer.pl
#  USpring
#
#  Created by kimbomm on 2018. 05. 02...
#  Copyright 2017 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
chdir "/tmp/";
system "curl -L https://github.com/springkim/USpring/releases/download/bin/hancomoffice-hwpviewer-Ubuntu-amd64.deb -o hancom.deb";
system "sudo gdebi hancom.deb -n";
