#!/usr/bin/perl
#  Desktop/install_vmware.pl
#  USpring
#
#  Created by kimbom on 2018. 05. 05...
#  Copyright 2018 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
sub AddFavorite($){
	my @arr=`lsb_release -a 2> /tmp/nul` =~ /^Release:\s+(.+)$/m;
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
die "Please run as not superuser" if($<==0);
system "sudo ls >/tmp/nul";
system "curl -L https://www.dropbox.com/s/rueosbce5lg6sdq/VMware-Player.bundle?dl=1 -o VMware-Player.bundle";
system "sudo apt-get install build-essential open-vm-tools -y";
system "sudo sh VMware-Player.bundle --console --required --eulas-agreed";
AddFavorite "vmware-player.desktop";
