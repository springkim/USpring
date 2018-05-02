#!/usr/bin/perl
#  Desktop/install_hancom_viewer.pl
#  USpring
#
#  Created by kimbom on 2018. 05. 02...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
chdir "/tmp/";
system "curl -L https://www.dropbox.com/s/lpgymhc1x61pi6w/hancomoffice-hwpviewer-Ubuntu-amd64.deb?dl=1 -o hancom.deb";
system "sudo gdebi hancom.deb -n";
