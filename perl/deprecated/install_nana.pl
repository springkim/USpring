#!/usr/bin/perl
#  Desktop/install_nana.pl
#  USpring
#
#  Created by kimbom on 2017. 9. 22...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
system "sudo ls";



system "wget https://www.dropbox.com/s/fokj1yy7q0ff8ej/nana%201.5.5.zip?dl=1 -O nana1.5.5.zip";
system "unzip nana1.5.5.zip";
chdir "nana";
system "mkdir ubuntu";
system "cmake . -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=ubuntu";
system "make";
system "make install";

system "sudo cp -r ubuntu/include/nana /usr/include/";
system "sudo cp ubuntu/lib/* /usr/lib/";
chdir "..";
system "sudo rm -r nana";
system "sudo rm nana1.5.5.zip";
