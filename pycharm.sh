#!/usr/bin/bash
#  pycharm.sh
#  USpring
#
#  Created by kimbomm on 2020. 12. 08...
#  Copyright 2020 kimbomm. All rights reserved.
#
result=`zenity --file-selection --file-filter='Tar.gz files (tar.gz) | *.tar.gz'`
mkdir -p ~/Program
tar xzvf $result -C ~/Program/
PYCHARM_ROOT=`ls ~/Program | grep pycharm | head -1`
sudo ln -s ~/Program/$PYCHARM_ROOT/bin/pycharm.sh /usr/bin/pycharm


sudo echo -e "[Desktop Entry]\nType=Application\nGenericName=pycharm\nName=pycharm\nComment=IDE\nIcon=$HOME/Program/$PYCHARM_ROOT/bin/pycharm.png\nExec=pycharm\nTerminal=false\nCategories=IDE" >> /tmp/jetbrains-pycharm.desktop


sudo mv /tmp/jetbrains-pycharm.desktop /usr/share/applications/jetbrains-pycharm.desktop


APP=jetbrains-pycharm.desktop
APPS=`gsettings get org.gnome.shell favorite-apps | sed s/]/,/`
gsettings set org.gnome.shell favorite-apps "$APPS '$APP']"
