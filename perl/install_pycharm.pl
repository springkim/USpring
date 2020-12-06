#!/usr/bin/perl
#  Desktop/install_pycharm.pl
#  USpring
#
#  Created by kimbomm on 2020. 02. 22...
#  Copyright 2020 kimbomm. All rights reserved.
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
#Select pycharm tar.gz file
my $result=`zenity --file-selection --file-filter='Tar.gz files (tar.gz) | *.tar.gz'`;
die "Please select pycharm file" if($result eq "");
print($result);
system "tar xzvf $result";
system "mkdir ~/Program" unless(-d "$ENV{'HOME'}/Program");
system "rm -r ~/Program/pycharm-*";
system "mv pycharm-* ~/Program/";
system "sudo rm /usr/bin/pycharm";
system "sudo ln -s ~/Program/pycharm-*/bin/pycharm.sh /usr/bin/pycharm";

system "curl -L https://github.com/springkim/USpring/releases/download/icon/pycharm.png -o ~/Program/pycharm-*/bin/pycharm.png";
system "curl -L https://github.com/springkim/USpring/releases/download/icon/pycharm.svg -o ~/Program/pycharm-*/bin/pycharm.svg";

#Create desktop shortcut
my $data=do{
    local $/=undef;
    <DATA>;
};
my $tmpfile="install_pycharm.tmp.pl";
open FP,">",$tmpfile;
print FP $data;
close FP;
system "sudo perl $tmpfile";
unlink $tmpfile;
AddDockIcon("jetbrains-pycharm-ce.desktop");
system "gnome-shell --replace & disown";
#sudo find / -name "*pycharm*" -exec rm -r {} \;
__DATA__
use strict;
use warnings;
open FP,">","/usr/share/applications/jetbrains-pycharm-ce.desktop" or die "$!\n";
my $data=<<EOF
[Desktop Entry]
Type=Application
GenericName=pycharm
Name=pycharm
Comment=IDE
Icon=/opt/pycharm.svg
Exec=pycharm
Terminal=false
Categories=IDE
EOF
;
print FP $data;
close FP;
system "curl -L https://github.com/springkim/USpring/releases/download/icon/pycharm.svg -o /opt/pycharm.svg";
