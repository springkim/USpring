use strict;
use warnings;
print "MSG : ";
my $msg=<STDIN>;
system "git add -A";
system "git commit -m \"$msg\"";
system "git push origin master";
