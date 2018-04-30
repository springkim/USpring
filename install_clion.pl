#!/usr/bin/perl
#  Desktop/install_clion.pl
#  USpring
#
#  Created by kimbom on 2018. 02. 09...
#  Copyright 2018 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
use LWP::Simple;
#Check root
die "Please run as not superuser" if($<==0);
#Download CLION

my $url="https://www.jetbrains.com/clion/whatsnew/";
my $html = get($url);
my @version = $html =~ m!(CLion [0-9\.]+)!;
my $version = substr($version[0],6,length($version[0])-6);

chdir "/tmp/";
system "curl -L https://download.jetbrains.com/cpp/CLion-$version.tar.gz -o clion.tar.gz";
system "tar xzvf clion.tar.gz";
system "mkdir ~/Program" unless(-d "$ENV{'HOME'}/Program");
system "mv clion-$version ~/Program/";

system "curl -L https://www.dropbox.com/s/u3gav8tcwxdxnfu/settings.jar?dl=1 -o $ENV{'HOME'}/Program/clion-$version/settings.jar";
system "rm clion.tar.gz";
system "sudo ln -s ~/Program/clion-$version/bin/clion.sh /usr/bin/clion";
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
my $desktop="application://jetbrain.clion.desktop";
my $cmd=`gsettings get com.canonical.Unity.Launcher favorites | sed s/]/,/`;
chomp($cmd);
system "gsettings set com.canonical.Unity.Launcher favorites \"$cmd \'$desktop\']\"";
__DATA__
use strict;
use warnings;
open FP,">","/usr/share/applications/jetbrain.clion.desktop" or die "$!\n";
my $data=<<EOF
[Desktop Entry]
Type=Application
GenericName=CLion
Name=CLion
Comment=IDE
Icon=/opt/clion.png
Exec=clion
Terminal=true;
Categories=IDE;
EOF
;
print FP $data;
close FP;
system "curl -L https://ucarecdn.com/bc9fb611-4353-481a-b6a6-35a6337c8451/ -o /opt/clion.png";


