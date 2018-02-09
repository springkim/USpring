#!/usr/bin/perl
#  Desktop/install_gpu.pl
#  USpring
#
#  Created by kimbom on 2018. 02. 09...
#  Copyright 2018 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
system "sudo add-apt-repository ppa:graphics-drivers/ppa -y";
system "sudo apt-get update";
system "sudo apt-get install nvidia-390 -y";
#Last check date : 2018.02.09
#https://www.geforce.com/drivers
#1080ti, 1080, 950m, titan X(maxwell)
system "sudo reboot";

