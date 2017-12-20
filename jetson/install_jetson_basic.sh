sudo apt-get install fcitx fcitx-hangul -y

sudo apt-get install language-pack-en language-pack-en-base language-pack-gnome-en language-pack-gnome-en-base -y
sudo apt-get install language-pack-ko language-pack-gnome-ko language-pack-ko-base language-pack-gnome-ko-base -y

sudo apt-get install $(check-language-support -l en) -y
sudo apt-get install $(check-language-support -l ko) -y
