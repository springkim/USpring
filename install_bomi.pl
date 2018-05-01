#!/usr/bin/perl
#  Desktop/install_bomi.pl
#  USpring
#
#  Created by kimbom on 2017. 08. 21...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);
my @arr=`lsb_release -a` =~ /^Release:\s+(.+)$/m;
die "Bomi is not woring on 18.04" if($arr[0] eq "18.04")

#Install dependencies
system "sudo apt-get install gdebi-core -y";
#Download bomi(It can't download from ppa)
chdir "/tmp/";
system "curl -L https://www.dropbox.com/s/zsfu3lt0siha0d6/bomi_0.9.11ppa1-vivid1_amd64.deb?dl=1 -o bomi.deb";
system "sudo gdebi bomi.deb -n";
unlink "bomi.deb";
