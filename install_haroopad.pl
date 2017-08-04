#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

#Check root
die "This scripr must be run as root" if($<!=0);

say "haroopad downloading...";
system "wget https://www.dropbox.com/s/ck3dccag6xdx3vx/haroopad-v0.13.1-x64.deb?dl=0 -O haroopad.deb";
system "sudo dpkg -i haroopad.deb";
system "sudo apt-get install -f -y";
system "sudo dpkg -i haroopad.deb";
unlink "haroopad.deb";

my $desktop="application://Haroopad.desktop";
my $cmd=`gsettings get com.canonical.Unity.Launcher favorites | sed s/]/,/`;
system "gsettings set com.canonical.Unity.Launcher favorites \"$cmd \'$desktop\']\"";

