#!/usr/bin/bash
#  haroopad.sh
#  USpring
#
#  Created by kimbomm on 2020. 12. 07...
#  Copyright 2020 kimbomm. All rights reserved.
#
sudo apt -y install libgconf-2-4
wget https://bitbucket.org/rhiokim/haroopad-download/downloads/haroopad-v0.13.1-x64.deb -O /tmp/haroopad.deb
sudo dpkg -i /tmp/haroopad.deb
sudo apt install -f -y
sudo dpkg -i /tmp/haroopad.deb
