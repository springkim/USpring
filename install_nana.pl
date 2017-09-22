#!/usr/bin/perl
#  install_wx.pl
#  USpring
#
#  Created by kimbom on 2017. 9. 22...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "This scripr must be run as root" if($<!=0);



system "wget https://www.dropbox.com/s/fokj1yy7q0ff8ej/nana%201.5.5.zip?dl=1 -o nana1.5.5.zip";
system "unzip nana1.5.5.zip";
chdir "nana";
mkdir "ubuntu";
system "cmake . -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=ubuntu";
system "make";
system "make install";

system "cp -r ubuntu/install/nana /usr/include/";
system "cp ubuntu/lib/* /usr/lib/";

