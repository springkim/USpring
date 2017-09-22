#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

#Check root
die "This scripr must be run as root" if($<!=0);

say "google-chrome downloading...";
system "wget https://www.dropbox.com/s/67m0aeqcnaggf5x/google-chrome-stable_current_amd64.deb?dl=0 -O chrome.deb";
system "sudo dpkg -i chrome.deb";
system "sudo apt-get install -f -y";
system "sudo dpkg -i chrome.deb";
unlink "chrome.deb";

my $desktop="application://google-chrome.desktop";
my $cmd=`gsettings get com.canonical.Unity.Launcher favorites | sed s/]/,/`;
system "gsettings set com.canonical.Unity.Launcher favorites \"$cmd \'$desktop\']\"";

