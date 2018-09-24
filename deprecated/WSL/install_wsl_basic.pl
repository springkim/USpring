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

#Input github information
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
system "git config --global credential.helper 'cache --timeout=1000000'";

#setup WSL for GUI(unity)
system "sudo apt-get update && sudo apt-get upgrade -y";
system "sudo apt-get -y install ubuntu-desktop unity compizconfig-settings-manager";
system "echo \"export DISPLAY=localhost:0\" >> ~/.bashrc";


say "Run \"ccsm\" after \"VcXsrv\" on Windows and check below";
say "General::Commands";
say "General::Composite";
say "General::Copy to texture";
say "General::OpenGL";
say "Desktop::Expo";
say "Desktop::Ubuntu Unity Plugin";
say "Image Loading::PNG";
say "Utility::Compiz Library Toolbox";
say "Window Management::Move Window";
say "Window Management::Place Windows";
say "Window Management::Resize Window";
say "Window Management::Scale Window";
say "Window Management::Snapping Window";
