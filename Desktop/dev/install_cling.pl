use HTML::LinkExtractor;
use Data::Dumper;
use LWP::Simple;

my $html = get("https://root.cern.ch/download/cling/");
my $LX = new HTML::LinkExtractor();
$LX->parse(\$html);

my $download="https://root.cern.ch/download/cling/";
my $bzname="";
for my $Link( @{ $LX->links } ) {
	if( $$Link{href}=~ m{ubuntu16} ) {
		$download.=$$Link{href};
		$bzname=$$Link{href};
		last;
	}
}
print $download,"\n";
chdir $ENV{"HOME"};
system "curl -L $download -o $bzname";
system "tar -xvf $bzname";
unlink $bzname;
my @dirname=split /\./,$bzname;
my $dirname=$dirname[0];
print $dirname,"\n";
#Link directories
my $home=$ENV{"HOME"};
open FP,">>",$ENV{"HOME"}."/.bashrc";
print FP "\n\n";
print FP "export PATH=$home/$dirname/bin"."\n";
close FP;

chdir "$home/$dirname/share/cling/Jupyter/kernel";
system "pip3 install -e .";
system "jupyter-kernelspec install --user cling-cpp17";

__END__
