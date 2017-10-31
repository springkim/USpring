#!/usr/bin/perl

use strict;
use warnings;
use feature qw(say);
#Check root
die "This script must be run as root" if($<!=0);
#Check GPU model
#my $gpu=(`lspci | grep -i VGA`=~/(\[.+\])/)[0];
#say $gpu;

#my @allow_gpu;
#push @allow_gpu,"[GeForce GTX 750 Ti]";

#die "This program not support your GPU" unless(grep{$_ eq $gpu}@allow_gpu);

system "add-apt-repository ppa:graphics-drivers/ppa -y";
system "apt-get update";
system "apt-get install nvidia-384 -y";
system "reboot";

