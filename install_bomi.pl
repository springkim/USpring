#!/usr/bin/perl
#  install_bomi.pl
#  USpring
#
#  Created by kimbom on 2017. 8. 21...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);

system "wget https://www.dropbox.com/s/wk2c0bbr3p3dzpo/bomi_0.9.11ppa1-vivid1_amd64.deb -O bomi.deb";

system "gdebi bomi.deb";

unlink "bomi.deb";
