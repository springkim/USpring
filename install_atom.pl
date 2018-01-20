#!/usr/bin/perl
#  install_atom.pl
#  USpring
#
#  Created by kimbom on 2018. 1. 20...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);

system "sudo apt-get install clang-format -y";

system "wget https://atom.io/download/deb -O atom.deb";

system "sudo gdebi atom.deb -n";

unlink "atom.deb";
