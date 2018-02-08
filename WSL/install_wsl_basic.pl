#  install_wsl_basic.pl
#  USpring/WSL
#
#  Created by kimbom on 2018. 02. 03...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);


#Check root
die "Please run as not superuser" if($<==0);
system "sudo apt-get update";
#setup WSL for GUI.
system "sudo systemd-machine-id-setup";
system "sudo dbus-uuidgen";
system "cat /etc/machine-id";
system "sudo apt -y install x11-apps xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic";
system "echo \"export DISPLAY=:0\" >> ~/.bashrc";
#install korean font
system "sudo apt-get install language-pack-ko fonts-unfonts-core fonts-unfonts-extra fonts-baekmuk fonts-nanum fonts-nanum-coding fonts-nanum-extra -y";
#my $data=do{
#    local $/=undef;
#    <DATA>;
#};
#my $tmpfile="install_wsl_baslic.tmp.pl";
#open FP,">",$tmpfile;
#print FP $data;
#close FP;
#system "sudo perl $tmpfile";
#unlink $tmpfile;

#install basic program.
system "sudo apt-get install firefox gedit nautilus file-roller -y";

__DATA__
use strict;
use warnings;
open(FP,'>>','/etc/default/locale');
print FP "LANG=\"en_US.UTF-8\"\n";
print FP "LANG=\"ko_KR.UTF-8\"\n";
close FP;
open(FP,'>>','/etc/environment');
print FP "LANG=\"ko_KR.UTF-8\"\n";
print FP "LANGUAGE=\"ko_KR:ko:en_GB:en\"\n";
close FP;


