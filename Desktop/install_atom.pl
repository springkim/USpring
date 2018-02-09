#!/usr/bin/perl
#  Desktop/install_atom.pl
#  USpring
#
#  Created by kimbom on 2018. 01. 20...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);
chdir "/tmp/";
system "sudo apt-get install clang-format -y";
system "curl -L https://atom.io/download/deb -o atom.deb";
system "sudo gdebi atom.deb -n";
unlink "atom.deb";
