#!/usr/bin/perl
#  install_clion.pl
#  USpring
#
#  Created by kimbom on 2017. 9. 24...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);


system "wget https://www.dropbox.com/s/1t7rr68nd4zn0dq/CLion-2017.2.2.tar.gz?dl=1 -O CLion-2017.2.2.tar.gz";
system "tar xzvf CLion-2017.2.2.tar.gz";
system "mkdir ~/Program" unless(-d "~/Program");
system "mv clion-2017.2.2 ~/Program/";
system "rm CLion-2017.2.2.tar.gz";

system "sh ~/Program/clion-2017.2.2/bin/clion.sh &";


