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
system "sudo mkdir /etc/atom/";
system "sudo chmod 777 /etc/atom";
system "curl -L https://gist.githubusercontent.com/springkim/756f0aa50ee265f28e2465e83f70b613/raw/531e6e7fee132c86a4f03dbfca4d2c19660a3f71/uncrustify-cpp.cfg -o /etc/atom/uncrustify-cpp.cfg";
