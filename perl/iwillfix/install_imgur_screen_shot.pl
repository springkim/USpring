#!/usr/bin/perl
#  Desktop/install_imgur_screen_shot.pl
#  USpring
#
#  Created by kimbomm on 2017. 08. 25...
#  Copyright 2017 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#https://askubuntu.com/questions/573535/setting-special-keys-as-keyboard-shortcuts
#https://askubuntu.com/questions/527990/add-a-custom-keybinding-with-gsettings-in-ubuntu/638900
#Check root
die "Please run as not superuser" if($<==0);
system "sudo apt-get install xclip curl -y";


my $key=`gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | sed s/]/,/`;
if(length($key)==7){
	$key='[';
}
system "gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom143/ name imgur-screenshot";
system "gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom143/ command imgur-screenshot.sh";
system "gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom143/ binding \"<Primary><Shift>r\"";
system "gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \"$key\'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom143/\']\"";


$key=`gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | sed s/]/,/`;
if(length($key)==7){
	$key='[';
}
system "gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom144/ name imgur-screenshot-w";
system "gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom144/ command imgur-screenshot-w.sh";
system "gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom144/ binding \"<Primary><Shift>w\"";
system "gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \"$key\'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom144/\']\"";


system "sudo wget https://github.com/springkim/USpring/releases/download/bin/imgur-screenshot.sh -O /usr/bin/imgur-screenshot.sh";
system "sudo wget https://github.com/springkim/USpring/releases/download/bin/imgur-screenshot-w.sh -O /usr/bin/imgur-screenshot-w.sh";
system "sudo chmod +x /usr/bin/imgur-screenshot.sh";
system "sudo chmod +x /usr/bin/imgur-screenshot-w.sh";
system "mkdir ~/Pictures";
say "========================================";
say "Capture Window and upload : Ctrl + SHift + W";
say "Capture Region and upload : Ctrl + SHift + R";
say "========================================";
