#!/usr/bin/bash
#  cpu_performance.sh
#  USpring
#
#  Created by kimbomm on 2020. 12. 07...
#  Copyright 2020 kimbomm. All rights reserved.
#
sudo apt install -y indicator-cpufreq
echo 'indicator-cpufreq& 2> /dev/null' >> /etc/rc.local
indicator-cpufreq& 2> /dev/null
