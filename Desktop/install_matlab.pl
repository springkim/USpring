#!/usr/bin/perl
#  Desktop/install_matlab.pl
#  USpring
#
#  Created by kimbom on 2018. 02. 09...
#  Copyright 2018 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);

#Check root
die "Please run as not superuser" if($<==0);

my $data=do{
    local $/=undef;
    <DATA>;
};
my $tmpfile="install_matlab.tmp.pl";
open FP,">",$tmpfile;
print FP $data;
close FP;
system "sudo perl $tmpfile";
unlink $tmpfile;


__DATA__
use feature qw(say);
#Download Matlab.
my $file="matlab_R2017a_glnxa64.zip";
say "matlab downloading...";
system "wget https://www.dropbox.com/s/n5rq0k5wjkdhlvb/matlab_R2017a_glnxa64.zip?dl=0 -O $file";
system "unzip $file";
system "chmod 755 -R MATLAB";

#Install.
system "./MATLAB/install";

#die if install failed.
die "MATLAB R2017a is not installed" unless(-e "/usr/local/MATLAB/R2017a/bin/matlab");

#Remove all install files.
system "rm -r MATLAB";
unlink "matlab_R2017a_glnxa64.zip";
#Make SIMLINK.
unless(-e '/usr/bin/matlab'){
	system "ln -s /usr/local/MATLAB/R2017a/bin/matlab /usr/bin";
}
#Make Desktop file.
open FP,">","/usr/share/applications/matlab.desktop" or die "$!\n";
my $file_object=<<EOF
[Desktop Entry]
Type=Application
GenericName=MatlabR2017a
Name=Matlab
Comment=Matlab Development Environment
Icon=/opt/matlab.png
Exec=matlab -desktop
Terminal=true;
Categories=Development;IDE;Matlab;
EOF
;
print FP $file_object;
close FP;

#Download matlab icon.
system "wget https://www.dropbox.com/s/p2nao4jlcesj4sr/matlab.png?dl=0 -O /opt/matlab.png";

my $desktop="application://matlab.desktop";
my $cmd=`gsettings get com.canonical.Unity.Launcher favorites | sed s/]/,/`;
system "gsettings set com.canonical.Unity.Launcher favorites \"$cmd \'$desktop\']\"";

