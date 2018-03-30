#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

#Check root
die "This scripr must be run as not root" if($<==0);

chdir "/tmp/";
system "wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb";
system "sudo apt-get install libxss1 libgconf2-4 libappindicator1 libindicator7 -y";
system "sudo dpkg -i google-chrome-stable_current_amd64.deb";
unlink "google-chrome-stable_current_amd64.deb";


my $desktop="application://google-chrome.desktop";
my $cmd=`gsettings get com.canonical.Unity.Launcher favorites | sed s/]/,/`;
system "gsettings set com.canonical.Unity.Launcher favorites \"$cmd \'$desktop\']\"";

