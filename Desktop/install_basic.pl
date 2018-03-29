#!/usr/bin/perl
#  Desktop/install_basic.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 02...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
#Input github information
print "github user.name : ";
my $github_name=<STDIN>;
chomp($github_name);
print "github user.email : ";
my $github_email=<STDIN>;
chomp($github_email);

system "sudo apt-get update && sudo apt-get upgrade -y";

system 'sudo apt-get install gcc g++ fpc python3 vim git inkscape cmake curl gdebi -y';
system "git config --global user.name \"$github_name\"";
system "git config --global user.email \"$github_email\"";
system "git config --global credential.helper 'cache --timeout=1000000'";
#Install theme
system "sudo add-apt-repository ppa:snwh/pulp -y";
system "sudo add-apt-repository ppa:numix/ppa -y";
system "sudo add-apt-repository ppa:noobslab/themes -y";
system "sudo apt-get update";
system "sudo apt-get install numix-gtk-theme numix-icon-theme-circle numix-icon-theme royal-gtk-theme unity-tweak-tool tweak paper-gtk-theme -y";
#Install exfat
system "sudo apt-get install exfat-fuse exfat-utils -y";
#Install gparted
system "sudo apt-get install gparted -y";
#Disable error report
system "sudo echo enabled=0 | sudo tee /etc/default/apport";
#Install perl libries
system "sudo cpan install Net::Address::IP::Local";
system "sudo cpan install HTML::LinkExtractor";
system "sudo cpan install WWW::Mechanize";
#Hide Desktop icons
#system "gsettings set org.gnome.desktop.background show-desktop-icons false";
#Enable desktop wallpaper change
#system "gsettings set org.gnome.settings-daemon.plugins.background active true";
