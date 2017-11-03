#!/usr/bin/perl
#  install_basic.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 2...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);
system "sudo ls";

print "github user.name : ";
my $github_name=<STDIN>;
chomp($github_name);
print "github user.email : ";
my $github_email=<STDIN>;
chomp($github_email);

system "sudo apt-get update && sudo apt-get upgrade -y";

system 'sudo apt-get install gcc g++ fpc python3 vim git inkscape cmake -y';
system "git config --global user.name \"$github_name\"";
system "git config --global user.email \"$github_email\"";

#install theme
system "sudo add-apt-repository ppa:snwh/pulp -y";
system "sudo add-apt-repository ppa:numix/ppa -y";
system "sudo add-apt-repository ppa:noobslab/themes -y";
system "sudo apt-get update";
system "sudo apt-get install numix-gtk-theme numix-icon-theme-circle numix-icon-theme royal-gtk-theme unity-tweak-tool tweak paper-gtk-theme -y";
#install exfat
system "sudo apt-get install exfat-fuse exfat-utils -y";

system "sudo echo enabled=0 | sudo tee /etc/default/apport";

#install perl libries
system "cpan install Net::Address::IP::Local";
