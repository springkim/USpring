#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
system "sudo ls";
system "wget https://www.dropbox.com/s/ovyi5wqb3g3efc9/cudnn-8.0-linux-x64-v5.1.tgz?dl=0 -O cudnn.tgz";

system "tar xvzf cudnn.tgz";
system "sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include";
system "sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64";
system "sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*";
system "sudo apt-get install libcupti-dev -y";

unlink "cudnn.tgz";
#Remove all install files.
system "sudo rm -r cuda";
