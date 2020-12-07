#!/usr/bin/bash
#  install_basic.pl
#  USpring
#
#  Created by kimbomm on 2020. 12. 03...
#  Copyright 2020 kimbomm. All rights reserved.
#

sudo apt update
sudo apt upgrade -y
sudo apt install gcc-8 g++-8 fpc python3 python-is-python3 python3-pip vim git inkscape cmake curl gdebi exfat-fuse gparted ubuntu-restricted-extras gnome-tweak-tool -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 9999
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 9999

