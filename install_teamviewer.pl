#!/usr/bin/perl
#  Desktop/install_teamviewer.pl
#  USpring
#
#  Created by kimbom on 2018. 02. 09...
#  Copyright 2018 kimbom. All rights reserved.
#
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
die "Please run as not superuser" if($<==0);
system "sudo ls >/tmp/nul";
#Download teamviewer
chdir "/tmp/";
system "curl -L https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -o teamviewer.deb";
system "sudo dpkg -i teamviewer.deb";
system "sudo apt-get install -f -y";
system "sudo dpkg -i teamviewer.deb";
unlink "teamviewer.deb";
#Create desktop shortcut
my $data=do{
    local $/=undef;
    <DATA>;
};
my $tmpfile="install_teamviewer.tmp.pl";
open FP,">",$tmpfile;
print FP $data;
close FP;
system "sudo perl $tmpfile";
unlink $tmpfile;
AddFavorite "teamviewer.desktop";
__DATA__
use strict;
use warnings;
open FP,">","/usr/share/applications/teamviewer.desktop" or die "$!\n";
my $data=<<EOF
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Categories=Network;

Name=TeamViewer 13
Comment=Remote control and meeting solution.
Exec=/opt/teamviewer/tv_bin/script/teamviewer

Icon=/opt/teamviewer.png
EOF
;
print FP $data;
close FP;
system "curl -L http://icons.iconarchive.com/icons/blackvariant/button-ui-requests-3/1024/TeamViewer-icon.png -o /opt/teamviewer.png";
