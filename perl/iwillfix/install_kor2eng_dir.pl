#!/usr/bin/perl
#  Desktop/install_kor2eng_dir.pl
#  USpring
#
#  Created by kimbomm on 2018. 02. 09...
#  Copyright 2018 kimbomm. All rights reserved.
#
use strict;
use warnings;
use feature qw(say);
#Check root
die "Please run as not superuser" if($<==0);
chdir($ENV{'HOME'});
if(-d "다운로드"){
	unless(-d "Downloads"){
		system "mv 다운로드 Downloads";
		system "ln -s Downloads 다운로드";
	}
}
if(-d "문서"){
	unless(-d "Documents"){
		system "mv 문서 Documents";
		system "ln -s Documents 문서";
	}
}
if(-d "바탕화면"){
	unless(-d "Desktop"){
		system "mv 바탕화면 Desktop";
		system "ln -s Desktop 바탕화면";
	}
}
if(-d "비디오"){
	unless(-d "Videos"){
		system "mv 비디오 Videos";
		system "ln -s Videos 비디오";
	}
}
if(-d "사진"){
	unless(-d "Pictures"){
		system "mv 사진 Pictures";
		system "ln -s Pictures 사진";
	}
}
if(-d "음악"){
	unless(-d "Music"){
		system "mv 음악 Music";
		system "ln -s Music 음악";
	}
}
if(-d "공개"){
	unless(-d "Public"){
		system "mv 공개 Public";
		system "ln -s Public 공개";
	}
}
if(-d "템플릿"){
	unless(-d "Templates"){
		system "mv 템플릿 Templates";
		system "ln -s Templates 템플릿";
	}
}
