#!/usr/bin/perl
#  Desktop/install_haroopad.pl
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
system "sudo ls";
#Download haroopad
chdir "/tmp/";
system "curl -L https://www.dropbox.com/s/eh2n777bgrw9mtw/haroopad-v0.13.1-x64.deb?dl=1 -o haroopad.deb";
system "sudo dpkg -i haroopad.deb";
system "sudo apt-get install -f -y";
system "sudo dpkg -i haroopad.deb";
unlink "haroopad.deb";

my $desktop="application://Haroopad.desktop";
my $cmd=`gsettings get com.canonical.Unity.Launcher favorites | sed s/]/,/`;
system "gsettings set com.canonical.Unity.Launcher favorites \"$cmd \'$desktop\']\"";

