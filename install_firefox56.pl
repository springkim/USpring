#!/usr/bin/perl
#  install_firefox56.pl.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 20...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);

system "sudo apt-get purge firefox -y";
system "wget https://www.dropbox.com/s/mt8sjt45go8a0bn/firefox-56.0.2.tar.bz2?dl=0 -O firefox-56.0.2.tar";
system "tar -xvf firefox-56.0.2.tar";
chdir "firefox";
system "sudo cp -R * /usr/bin/";
chdir "..";
system "sudo rm -r firefox";
unlink "firefox-56.0.2.tar";
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

my $desktop="application://firefox.desktop";
my $cmd=`gsettings get com.canonical.Unity.Launcher favorites | sed s/]/,/`;
chomp($cmd);
system "gsettings set com.canonical.Unity.Launcher favorites \"$cmd \'$desktop\']\"";
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
Icon=/opt/Firefox.png
Exec=firefox
Terminal=true;
Categories=Internet;
EOF
;
print FP $data;
close FP;
system "wget https://www.dropbox.com/s/1uu2ssef3xfwsoh/Firefox.png?dl=0 -O /opt/Firefox.png";


