use strict;
use warnings;
system "sudo apt-get update && sudo apt-get upgrade -y";
system "sudo apt-get install xfce4 xrdp -y";

my $data=do{
    local $/=undef;
    <DATA>;
};
my $tmpfile="enable_remote_desktop.tmp.pl";
open FP,">",$tmpfile;
print FP $data;
close FP;
system "sudo perl $tmpfile";
unlink $tmpfile;

system "sudo /etc/init.d/xrdp restart";

#http://jimnong.tistory.com/695

__DATA__
use strict;
use warnings;
my $startwm="
#!/bin/sh

if [ -r /etc/default/locale ]; then
  . /etc/default/locale
  export LANG LANGUAGE
fi
 xfce4-session

. /etc/X11/Xsession
";

open FP,">","/etc/xrdp/startwm.sh";
print FP $startwm;
close FP;
