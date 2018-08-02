#language pack
sudo apt-get install fcitx fcitx-hangul -y

sudo apt-get install language-pack-en language-pack-en-base language-pack-gnome-en language-pack-gnome-en-base -y
sudo apt-get install language-pack-ko language-pack-gnome-ko language-pack-ko-base language-pack-gnome-ko-base -y

sudo apt-get install $(check-language-support -l en) -y
sudo apt-get install $(check-language-support -l ko) -y

#theme
sudo add-apt-repository ppa:snwh/pulp -y
sudo add-apt-repository ppa:numix/ppa -y
sudo add-apt-repository ppa:noobslab/themes -y
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle numix-icon-theme royal-gtk-theme unity-tweak-tool tweak paper-gtk-theme -y

#Support exfat file system
sudo apt-get install exfat-fuse exfat-utils -y

#ignore error
sudo echo enabled=0 | sudo tee /etc/default/apport


gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.gnome.settings-daemon.plugins.background active true

echo export LD_LIBRARY_PATH=/usr/local/lib >> ~/.bashrc

#light weight webbrowser
sudo apt-get install midori -y
