#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);
sub AddFavorite($){
	my @arr=`lsb_release -a` =~ /^Release:\s+(.+)$/m;
	my $desktop="";
	my $path="";
	if($arr[0] eq "18.04"){
		$desktop=shift;
		$path="org.gnome.shell favorite-apps";
	}else{
		$desktop="application://".shift;
		$path="com.canonical.Unity.Launcher favorites";
	}
	my $cmd=`gsettings get $path | sed s/]/,/`;
	chomp($cmd);
	system "gsettings set $path \"$cmd \'$desktop\']\"";
}
#Check root
die "This scripr must be run as not root" if($<==0);

chdir "/tmp/";
system "wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb";
system "sudo apt-get install libxss1 libgconf2-4 libappindicator1 libindicator7 -y";
system "sudo dpkg -i google-chrome-stable_current_amd64.deb";
unlink "google-chrome-stable_current_amd64.deb";

AddFavorite "google-chrome.desktop";


