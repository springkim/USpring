#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);
system "sudo ls";
my $exe="teamviewer_13.0.5693_amd64.deb";
say "teamviewer downloading...";
system "wget https://www.dropbox.com/s/q2sttkf9uul82nh/teamviewer_13.0.5693_amd64.deb?dl=1 -O $exe";
system "sudo dpkg -i $exe";
system "sudo apt-get install -f -y";
system "sudo dpkg -i $exe";
unlink "$exe";

my $desktop="application://com.teamviewer.TeamViewer.desktop";
my $cmd=`gsettings get com.canonical.Unity.Launcher favorites | sed s/]/,/`;
system "gsettings set com.canonical.Unity.Launcher favorites \"$cmd \'$desktop\']\"";

