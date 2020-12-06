#!/usr/bin/perl
#  install_theme_numix.pl
#  USpring
#
#  Created by kimbomm on 2019. 08. 16...
#  Copyright 2017-2019 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<!=0);
system 'sudo apt-get install gdebi -y';
#Install theme
system "sudo add-apt-repository ppa:numix/ppa -y";
system "sudo apt-get update";
system "sudo apt-get install numix-gtk-theme numix-icon-theme-circle numix-icon-theme -y";
#https://www.gnome-look.org/p/1013698/
system "gsettings set org.gnome.desktop.interface gtk-theme Numix";
system "gsettings set org.gnome.desktop.interface icon-theme Numix-Circle-Light";
