#!/usr/bin/bash
#  neofetch.sh
#  USpring
#
#  Created by kimbomm on 2020. 12. 07...
#  Copyright 2020 kimbomm. All rights reserved.
#
git clone https://github.com/dylanaraps/neofetch
cd neofetch
sudo make install
rm -rf neofetch
