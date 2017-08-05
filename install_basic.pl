#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);

#Check root
die "This scripr must be run as root" if($<!=0);


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
$cmd='apt-get install gcc g++ fpc python3 vim git -y';
say $cmd;
system $cmd;
$cmd="git config --global user.name \"$github_name\"";
say $cmd;
system $cmd;
$cmd="git config --global user.email \"$github_email\"";
say $cmd;
system $cmd;

$cmd="add-apt-repository ppa:numix/ppa -y && add-apt-repository ppa:noobslab/themes -y && apt-get update && sudo apt-get install numix-gtk-theme numix-icon-theme-circle numix-icon-theme -y && apt-get install royal-gtk-theme && apt-get install unity-tweak-tool && apt-get install tweak && apt-get install exfat-fuse exfat-utils";
print $cmd;
system $cmd;

system "cpan install Net::Address::IP::Local";
