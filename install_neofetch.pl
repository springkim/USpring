#!/usr/bin/perl
#  install_neofetch.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 6...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
die "Please run as not superuser" if($<==0);
system "sudo ls";
my $exe="neofetch-3.3.0";
system "wget https://www.dropbox.com/s/2xsf2iyokf23pnz/neofetch-3.3.0.zip?dl=1 -O $exe.zip";
system "unzip $exe.zip";

chdir "$exe";
system "sudo make install";
chdir "..";
system "sudo rm -r $exe";
system "sudo rm $exe.zip";
system "neofetch";

