#!/usr/bin/perl
#  install_qt.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 23...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
system "sudo ls";


#http://download.qt.io/official_releases/qt/5.9/5.9.3/qt-opensource-linux-x64-5.9.3.run.mirrorlist
my $qt="qt-opensource-linux-x64-5.9.3.run";
system "wget https://www.dropbox.com/s/ul0k9mhhd8lin35/qt-opensource-linux-x64-5.9.3.run?dl=0 -O $qt";
system "chmod +x $qt";
system "./$qt";

unlink $qt;


