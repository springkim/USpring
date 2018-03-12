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
#setup WSL for GUI(unity)
system "sudo apt update && sudo apt upgrade -y";
system "sudo apt -y install ubuntu-desktop unity compizconfig-settings-manager";
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
