#!/usr/bin/bash
#  install_theme.pl
#  USpring
#
#  Created by kimbomm on 2020. 12. 03...
#  Copyright 2020 kimbomm. All rights reserved.
#
wget https://installer-whale.pstatic.net/downloads/installers/naver-whale-stable_amd64.deb -O /tmp/whale.deb
sudo dpkg -i /tmp/whale.deb
