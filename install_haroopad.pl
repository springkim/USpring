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
use WWW::Mechanize;
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
#Check root
die "Please run as not superuser" if($<==0);
system "sudo ls >/tmp/nul";
#Download haroopad
chdir "/tmp/";

my $url="https://bitbucket.org/rhiokim/haroopad-download/downloads/";
my $mech = WWW::Mechanize->new();
$mech->get($url);
my @links = $mech->links();
my @href;
($_->url=~m!x64.*\.deb!) and push @href,$_->url foreach(@links);
@href=reverse sort @href;
my $latest_url="https://bitbucket.org$href[0]";
system "curl -L $latest_url -o haroopad.deb";
system "sudo dpkg -i haroopad.deb";
system "sudo apt-get install -f -y";
system "sudo dpkg -i haroopad.deb";
unlink "haroopad.deb";
AddFavorite "Haroopad.desktop";
