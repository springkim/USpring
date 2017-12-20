#!/usr/bin/perl
#  install_kor2eng_dir.pl
#  USpring
#
#  Created by kimbom on 2017. 11. 4...
#  Copyright 2017 kimbom. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);

if(-d "~/다운로드"){
	unless(-d "~/Downloads"){
		system "mv ~/다운로드 ~/Downloads";
	}
}
if(-d "~/문서"){
	unless(-d "~/Documents"){
		system "mv ~/문서 ~/Documents";
	}
}
if(-d "~/바탕화면"){
	unless(-d "~/Desktop"){
		system "mv ~/바탕화면 ~/Desktop";
	}
}
if(-d "~/비디오"){
	unless(-d "~/Videos"){
		system "mv ~/비디오 ~/Videos";
	}
}
if(-d "~/사진"){
	unless(-d "~/Pictures"){
		system "mv ~/사진 ~/Pictures";
	}
}
if(-d "~/음악"){
	unless(-d "~/Music"){
		system "mv ~/음악 ~/Music";
	}
}
if(-d "~/공개"){
	unless(-d "~/Public"){
		system "mv ~/공개 ~/Public";
	}
}
if(-d "~/템플릿"){
	unless(-d "~/Templates"){
		system "mv ~/템플릿 ~/Templates";
	}
}
