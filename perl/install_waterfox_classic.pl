#!/usr/bin/perl
#  Desktop/install_waterfox.pl
#  USpring
#
#  Created by kimbomm on 2019. 12. 21...
#  Copyright 2019 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
use LWP::Simple;
use FindBin qw($RealBin);   # Directory in which the script lives
use lib "$RealBin/lib";  # Where modules are, relative to $RealBin
require 'lib_dock.pl';

#Check root
die "Please run as not superuser" if($<==0);
#Install dependencies
system "sudo apt-get install flashplugin-installer curl -y";
#Verify latest version
my $url="https://www.waterfox.net/releases/";
my $html = get($url);
#https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-classic-2019.12.en-US.linux-x86_64.tar.bz2
my @url = $html =~ m!(https://[\w\.\-/]+waterfox-classic[\w\.\-/]+\.tar\.bz2)!;
print $url[0],"\n";
#Download firefox
chdir "/tmp/";
rmdir "waterfox";
system "curl -L $url[0] -o waterfox.tar.bz2";
system "bzip2 -d waterfox.tar.bz2";
system "tar -xvf waterfox.tar";
unlink "waterfox.tar";
chdir "waterfox-classic";
system "sudo cp -R * /usr/bin/";
chdir "..";
system "sudo rm -r waterfox-classic";
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
#Create desktop shortcut
AddDockIcon("waterfox-classic.desktop");
system "gnome-shell --replace & disown";
__DATA__
use strict;
use warnings;
open FP,">","/usr/share/applications/waterfox-classic.desktop" or die "$!\n";
my $data=<<EOF
[Desktop Entry]
Type=Application
GenericName=waterfox-classic
Name=waterfox-classic
Comment=Internet
Icon=/opt/waterfox.png
Exec=waterfox
Terminal=true;
Categories=Internet;
EOF
;
print FP $data;
close FP;
system "curl -L https://github.com/springkim/USpring/releases/download/icon/waterfox.png -o /opt/waterfox.png";
