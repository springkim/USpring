#!/usr/bin/bash
#  install_notepad++.pl
#  USpring
#
#  Created by kimbomm on 2020. 12. 07...
#  Copyright 2020 kimbomm. All rights reserved.
#
sudo apt-get install snapd snapd-xdg-open -y
sudo snap install notepad-plus-plus
sudo snap connect notepad-plus-plus:process-control
