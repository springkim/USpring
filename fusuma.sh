#!/usr/bin/bash
#  fusuma.sh
#  USpring
#
#  Created by kimbomm on 2020. 12. 03...
#  Copyright 2020 kimbomm. All rights reserved.
#
sudo gpasswd -a $USER input
sudo apt-get install libinput-tools -y
sudo apt-get install ruby -y
sudo gem install fusuma
sudo apt-get install xdotool -y
sudo gem update fusuma
sudo apt-get update
mkdir -p ~/.config/fusuma

cp settings/fusuma_config.yml ~/.config/fusuma/config.yml

echo gnome-session-properties
echo `which fusuma` -d
