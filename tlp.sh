#!/usr/bin/bash
#  install_tlp.pl
#  USpring
#
#  Created by kimbomm on 2020. 12. 03...
#  Copyright 2020 kimbomm. All rights reserved.
#
sudo add-apt-repository ppa:linrunner/tlp -y
sudo apt-get update
sudo apt-get install tlp tlp-rdw -y
sudo tlp start
