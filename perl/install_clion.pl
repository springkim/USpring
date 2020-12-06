#!/usr/bin/perl
#  Desktop/install_clion.pl
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
#Select CLion tar.gz file
my $result=`zenity --file-selection --file-filter='Tar.gz files (tar.gz) | *.tar.gz'`;
die "Please select clion file" if($result eq "");
print($result);
system "tar xzvf $result";
system "mkdir ~/Program" unless(-d "$ENV{'HOME'}/Program");
system "rm -r ~/Program/clion-*";
system "mv clion-* ~/Program/";
system "sudo rm /usr/bin/clion";
system "sudo ln -s ~/Program/clion-*/bin/clion.sh /usr/bin/clion";

system "curl -L https://github.com/springkim/USpring/releases/download/icon/clion.png -o ~/Program/clion-*/bin/clion.png";
system "curl -L https://github.com/springkim/USpring/releases/download/icon/clion.svg -o ~/Program/clion-*/bin/clion.svg";

#Create desktop shortcut
my $data=do{
    local $/=undef;
    <DATA>;
};
my $tmpfile="install_clion.tmp.pl";
open FP,">",$tmpfile;
print FP $data;
close FP;
system "sudo perl $tmpfile";
unlink $tmpfile;
AddDockIcon("jetbrains-clion.desktop");
system "gnome-shell --replace & disown";
#sudo find / -name "*clion*" -exec rm -r {} \;
__DATA__
use strict;
use warnings;
open FP,">","/usr/share/applications/jetbrains-clion.desktop" or die "$!\n";
my $data=<<EOF
[Desktop Entry]
Type=Application
GenericName=CLion
Name=CLion
Comment=IDE
Icon=/opt/clion.svg
Exec=clion
Terminal=false
Categories=IDE
EOF
;
print FP $data;
close FP;
system "curl -L https://github.com/springkim/USpring/releases/download/icon/clion.svg -o /opt/clion.svg";
