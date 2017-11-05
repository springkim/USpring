#!/usr/bin/perl
#  install_pycharm.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 05...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);


system "wget https://www.dropbox.com/s/40hwntlbg6uk1xs/pycharm-community-2017.2.4.tar.gz?dl=1 -O pycharm-community-2017.2.4.tar.gz";
system "tar xzvf pycharm-community-2017.2.4.tar.gz";
system "mkdir ~/Program";
system "mv pycharm-community-2017.2.4 ~/Program/";
system "rm pycharm-community-2017.2.4.tar.gz";

system "sh ~/Program/pycharm-community-2017.2.4/bin/pycharm.sh &";

