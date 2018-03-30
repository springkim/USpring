#!/usr/bin/perl
#  Desktop/install_neofetch.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 06...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
die "Please run as not superuser" if($<==0);
system "sudo ls";
chdir "/tmp/";
system "git clone https://github.com/dylanaraps/neofetch";
chdir "neofetch";
system "sudo make install";

