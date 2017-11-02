#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);
system "sudo ls";

say "teamviewer downloading...";
system "wget https://www.dropbox.com/s/qpmj7t8fibkkguq/teamviewer_12.0.76279_i386.deb?dl=0 -O teamviewer_i386.deb";
system "sudo dpkg -i teamviewer_i386.deb";
system "sudo apt-get install -f -y";
system "sudo dpkg -i teamviewer_i386.deb";
unlink "teamviewer_i386.deb";

my $desktop="application://com.teamviewer.TeamViewer.desktop";
my $cmd=`gsettings get com.canonical.Unity.Launcher favorites | sed s/]/,/`;
system "gsettings set com.canonical.Unity.Launcher favorites \"$cmd \'$desktop\']\"";

