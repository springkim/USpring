#!/usr/bin/bash
#  clion.sh
#  USpring
#
#  Created by kimbomm on 2020. 12. 08...
#  Copyright 2020 kimbomm. All rights reserved.
#
result=`zenity --file-selection --file-filter='Tar.gz files (tar.gz) | *.tar.gz'`
mkdir -p ~/Program
tar xzvf $result -C ~/Program/
CLION_ROOT=`ls ~/Program | grep clion | head -1`
sudo ln -s ~/Program/$CLION_ROOT/bin/clion.sh /usr/bin/clion


sudo echo -e "[Desktop Entry]\nType=Application\nGenericName=clion\nName=clion\nComment=IDE\nIcon=$HOME/Program/$CLION_ROOT/bin/clion.png\nExec=clion\nTerminal=false\nCategories=IDE" >> /tmp/jetbrains-clion.desktop


sudo mv /tmp/jetbrains-clion.desktop /usr/share/applications/jetbrains-clion.desktop


APP=jetbrains-clion.desktop
APPS=`gsettings get org.gnome.shell favorite-apps | sed s/]/,/`
gsettings set org.gnome.shell favorite-apps "$APPS '$APP']"
