#!/usr/bin/perl

use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);

system "sudo add-apt-repository ppa:graphics-drivers/ppa -y";
system "sudo apt-get update";
system "sudo apt-get install nvidia-384 -y";
system "sudo reboot";

