use strict;
use warnings;


system "apt install -y python3 python3-pip";
system "pip3 install --upgrade pip";
system "pip3 install jupyter";

my $dirname="cling_2018-03-01_ubuntu16";
chdir $ENV{"HOME"};
system "curl -L https://root.cern.ch/download/cling/$dirname.tar.bz2 -o $dirname.tar.bz2";
system "tar -xvf $dirname.tar.bz2";
unlink "$dirname.tar.bz2";

#Link directories
open FP,">>","root/.bashrc";
print FP "\n\n";
print FP "export PATH=root/$dirname/bin:\$PATH"."\n";
close FP;

chdir "root/$dirname/share/";
system "jupyter kernelspec install --user cling";

chdir "root/$dirname/share/cling/Jupyter/kernel";
system "pip3 install -e .";
system "jupyter-kernelspec install --user cling-cpp17";

