#!/usr/bin/perl
#  install_apache2_cgi.pl
#  USpring
#
#  Created by kimbom on 2017. 8. 5...
#  Copyright 2017 Sogang CVIP lab. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
use Net::Address::IP::Local;
#Check root
die "This scripr must be run as root" if($<!=0);

print "email : ";
my $email=<STDIN>;
chomp($email);
my $ip_address=Net::Address::IP::Local->public_ipv4;


#system "apt-get install apache2 -y";
my $doc=do{  
    local $/=undef;
    open FP,"<","/etc/apache2/sites-enabled/000-default.conf" or die "$!\n";
    <FP>;
};

say $ip_address;

############
#  IP and email setting in 000-default.conf file.
#
########
