#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

#Check root
die "This script must be run as root" if($<!=0);


print "github user.name : ";
my $github_name=<STDIN>;
chomp($github_name);
print "github user.email : ";
my $github_email=<STDIN>;
chomp($github_email);
my $cmd;

$cmd='apt-get update && sudo apt-get upgrade -y';
say $cmd;
system $cmd;
$cmd='apt-get install gcc g++ fpc python3 vim git inkscape -y';
say $cmd;
system $cmd;
$cmd="git config --global user.name \"$github_name\"";
say $cmd;
system $cmd;
$cmd="git config --global user.email \"$github_email\"";
say $cmd;
system $cmd;

#install theme
system "add-apt-repository ppa:snwh/pulp -y";
system "add-apt-repository ppa:numix/ppa -y";
system "add-apt-repository ppa:noobslab/themes -y";
system "apt-get update";
system "apt-get install numix-gtk-theme numix-icon-theme-circle numix-icon-theme royal-gtk-theme unity-tweak-tool tweak paper-gtk-theme -y";
system "apt-get install exfat-fuse exfau-utils -y";

#install perl libries
system "cpan install Net::Address::IP::Local";
