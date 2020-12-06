#!/usr/bin/bash
#  install_<WHAT>.pl
#  USpring
#
#  Created by kimbomm on 2020. 12. 07...
#  Copyright 2020 kimbomm. All rights reserved.
#
sudo apt-get install xclip curl -y



sudo wget https://github.com/springkim/USpring/releases/download/bin/imgur-screenshot.sh -O /usr/bin/imgur-screenshot.sh
sudo wget https://github.com/springkim/USpring/releases/download/bin/imgur-screenshot-w.sh -O /usr/bin/imgur-screenshot-w.sh
sudo chmod +x /usr/bin/imgur-screenshot.sh
sudo chmod +x /usr/bin/imgur-screenshot-w.sh
mkdir ~/Pictures
echo ========================================
echo Capture Window and upload : Ctrl + SHift + W
echo Capture Region and upload : Ctrl + SHift + R
echo ========================================
