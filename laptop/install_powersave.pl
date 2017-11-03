#!/usr/bin/perl
#  install_powersave.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 03...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);

system "wget -O .laptop-mode.sh http://drive.noobslab.com/data/improve-battery/laptop-mode";
system "chmod +x .laptop-mode.sh && ./.laptop-mode.sh"
unlink ".laptop-mode.sh";
