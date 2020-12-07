#!/usr/bin/bash
#  install_theme.pl
#  USpring
#
#  Created by kimbomm on 2020. 12. 03...
#  Copyright 2020 kimbomm. All rights reserved.
#
sudo apt-get install gdebi -y
sudo add-apt-repository ppa:numix/ppa -y
sudo add-apt-repository ppa:papirus/papirus -y

sudo apt-get update



sudo apt-get install papirus-icon-theme -y
sudo apt-get install numix-gtk-theme numix-icon-theme-circle numix-icon-theme -y

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

echo Install font(settings/CascadiaCodePL.ttf) and apply to monospace

