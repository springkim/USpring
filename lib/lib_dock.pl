#!/usr/bin/perl
#  lib_dock.pl
#  USpring
#
#  Created by kimbomm on 2019. 12. 21...
#  Copyright 2019 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
sub AddDockIcon($){
	my @arr=`lsb_release -a  2> /tmp/nul` =~ /^Release:\s+(.+)$/m;
	my $desktop="";
	my $path="";
	if($arr[0] >= 18.04){
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
return 1;
