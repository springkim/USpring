#!/usr/bin/perl
#  install_remote_desktop.pl
#  USpring
#
#  Created by kimbom on 2017. 8. 20...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "This scripr must be run as root" if($<!=0);

system "apt-get install xrdp -y";
system "apt-get update";
system "apt-get install mate-core mate-desktop-environment mate-notification-daemon -y";

system 'sed -i.bak \'/fi/a #xrdp multiple users configuration \n mate-session \n\' /etc/xrdp/startwm.sh';


