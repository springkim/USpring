#!/usr/bin/perl
#  install_powersave.pl
#  USpring
#
#  Created by kimbom on 2017. 03. 30...
#  Copyright 2018 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);

system "sudo apt-get install -y indicator-cpufreq";

my $data=do{
    local $/=undef;
    <DATA>;
};
my $tmpfile="install_powersave.tmp.sh";
open FP,">",$tmpfile;
print FP $data;
close FP;
system "sudo sh $tmpfile";
unlink $tmpfile;


system "indicator-cpufreq& 2> /dev/null";


#system "wget -O .laptop-mode.sh http://drive.noobslab.com/data/improve-battery/laptop-mode";
#system "chmod +x .laptop-mode.sh && ./.laptop-mode.sh";
#unlink ".laptop-mode.sh";

__DATA__
echo 'indicator-cpufreq& 2> /dev/null' >> /etc/rc.local
