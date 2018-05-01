#!/usr/bin/perl
#  Desktop/install_firefox56.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 20...
#  Copyright 2017 kimbom. All rights reserved.
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
#Remove default firefox(It maybe a firefox>=57)
system "sudo apt-get purge firefox -y";
#Install dependencies
system "sudo apt-get install flashplugin-installer -y";
#Download firefox
chdir "/tmp/";
system "curl -L https://ftp.mozilla.org/pub/firefox/releases/56.0.2/linux-x86_64/ko/firefox-56.0.2.tar.bz2 -o firefox-56.0.2.tar.bz2";
system "bzip2 -d firefox-56.0.2.tar.bz2";
system "tar -xvf firefox-56.0.2.tar";
unlink "firefox-56.0.2.tar";
chdir "firefox";
system "sudo cp -R * /usr/bin/";
chdir "..";
system "sudo rm -r firefox";
#Create desktop shortcut
my $data=do{
    local $/=undef;
    <DATA>;
};
my $tmpfile="install_firefox56.tmp.pl";
open FP,">",$tmpfile;
print FP $data;
close FP;
system "sudo perl $tmpfile";
unlink $tmpfile;
AddFavorite "firefox.desktop";
__DATA__
use strict;
use warnings;
open FP,">","/usr/share/applications/firefox.desktop" or die "$!\n";
my $data=<<EOF
[Desktop Entry]
Type=Application
GenericName=firefox56
Name=firefox
Comment=Internet
Icon=/opt/firefox.png
Exec=firefox
Terminal=true;
Categories=Internet;
EOF
;
print FP $data;
close FP;
system "curl -L http://pngimg.com/uploads/firefox/firefox_PNG21.png -o /opt/firefox.png";
