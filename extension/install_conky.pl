#!/usr/bin/perl
#  install_conky.pl
#  USpring
#
#  Created by kimbom on 2017. 8. 21...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "This scripr must be run as root" if($<!=0);
system "add-apt-repository ppa:teejee2008/ppa -y";
system "apt-get update";
system "apt-get install conky-manager";
