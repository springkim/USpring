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

#Check root
die "Please run as not superuser" if($<==0);
system "sudo ls";
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

my $desktop="application://teamviewer.desktop";
my $cmd=`gsettings get com.canonical.Unity.Launcher favorites | sed s/]/,/`;
system "gsettings set com.canonical.Unity.Launcher favorites \"$cmd \'$desktop\']\"";
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
