#!/usr/bin/perl
#  Desktop/install_waterfox.pl
#  USpring
#
#  Created by kimbomm on 2018. 09. 19...
#  Copyright 2018 kimbomm. All rights reserved.
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
#Check root
die "Please run as not superuser" if($<==0);
#Install dependencies
system "sudo apt-get install flashplugin-installer -y";
#Download firefox
chdir "/tmp/";
rmdir "waterfox";
system "curl -L https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-56.2.3.en-US.linux-x86_64.tar.bz2 -o waterfox.tar.bz2";
system "bzip2 -d waterfox.tar.bz2";
system "tar -xvf waterfox.tar";
unlink "waterfox.tar";
chdir "waterfox";
system "sudo cp -R * /usr/bin/";
chdir "..";
system "sudo rm -r waterfox";
#Create desktop shortcut
my $data=do{
    local $/=undef;
    <DATA>;
};
my $tmpfile="install_waterfox.tmp.pl";
open FP,">",$tmpfile;
print FP $data;
close FP;
system "sudo perl $tmpfile";
unlink $tmpfile;
AddFavorite "waterfox.desktop";
__DATA__
use strict;
use warnings;
open FP,">","/usr/share/applications/waterfox.desktop" or die "$!\n";
my $data=<<EOF
[Desktop Entry]
Type=Application
GenericName=waterfox
Name=waterfox
Comment=Internet
Icon=/opt/waterfox.png
Exec=waterfox
Terminal=true;
Categories=Internet;
EOF
;
print FP $data;
close FP;
system "curl -L http://icons.iconarchive.com/icons/papirus-team/papirus-apps/256/waterfox-icon.png -o /opt/waterfox.png";
