#!/usr/bin/perl
#  install_apache2_cgi.pl
#  USpring
#
#  Created by kimbom on 2017. 8. 5...
#  Copyright 2017 Sogang CVIP lab. All rights reserved.
#
#system "cpan install Net::Address::IP::Local";
use strict;
use warnings;
use feature qw(say);
use Net::Address::IP::Local;
#Check root
die "This script must be run as root" if($<!=0);

print "root dir : ";
my $root_dir=<STDIN>;
chomp($root_dir);
print "email : ";
my $email=<STDIN>;
chomp($email);
my $ip_address=Net::Address::IP::Local->public_ipv4;

system "apt-get install apache2 -y";
my $doc=do{  
    local $/=undef;
    open FP,"<","/etc/apache2/sites-enabled/000-default.conf" or die "$!\n";
    <FP>;
};
#change ServerName
$doc=~s/#ServerName www\.example\.com/ServerName $ip_address/;
#change root directory
$doc=~s/\/var\/www\/html/\/var\/www\/$root_dir/;
#change email
my $append_element="
	ScriptAlias /$root_dir/ /var/www/$root_dir/  
	<Directory \"/var/www/$root_dir\">  
                AllowOverride None
                Options  +ExecCGI -MultiViews +SymLinksIfOwnerMatch
                AddHandler cgi-script .cgi .pl
                Order allow,deny
                Allow from all
	</Directory>


";
$doc=~s/webmaster\@localhost/$email\n\n$append_element/;
open FP,">","/etc/apache2/sites-enabled/000-default.conf" or die "$!\n";
print FP $doc;
close FP;

my $doc2=do{
    local $/=undef;
    open FP,"<","/etc/apache2/apache2.conf" or die "$!\n";
    <FP>;
};
say $doc2;
$doc2=~s/#ServerRoot/ServerRoot/;


#/etc/apache2/apache2.conf line 164 replace
my $append_element2="
<Directory /var/www/$root_dir/>  
         Options FollowSymLinks ExecCGI MultiViews
         AddHandler cgi-script .cgi .pl
         AllowOverride None
         Require all granted
</Directory>  
";
$doc2=~s/<Directory \/var\/www\/>.+<\/Directory>/$append_element2/s;
$doc2.="\nServerName http://localhost";

open FP,">","/etc/apache2/apache2.conf" or die "$!\n";
print FP $doc2;
close FP;

system "a2enmod cgi";
#system "service apache2 restart";
system "apt-get install libcgi-session-perl -y";
print "
===============================================================
모든 설치가 끝났습니다.
마지막으로 콘솔창에서 아래의 명령어로 apache2 를 재시작 하십시오.
service apache2 restart
================================================================
";
