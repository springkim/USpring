#!/usr/bin/perl
#  install_notepad++.pl
#  USpring
#
#  Created by kimbomm on 2019. 08. 16...
#  Copyright 2017-2019 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<!=0);
chdir "/tmp/";
system "sudo apt-get install snapd snapd-xdg-open -y";
system "sudo snap install notepad-plus-plus";
system "sudo snap connect notepad-plus-plus:process-control";


#한글깨짐문제

