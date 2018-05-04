sudo apt-get install npm nodejs -y
sudo ln -s `which nodejs` /usr/bin/node
git clone https://github.com/Kwaadpepper/msi-keyboard-CLI.git ~/.msi-klm
cd ~/.msi-klm
npm install
msibacklight -k on
(OR)
sudo nodejs msi-keyboard-CLI.js -k on


sudo apt install wine64 -y
sudo dpkg --add-architecture i386
wget -qO- https://dl.winehq.org/wine-builds/Release.key | sudo apt-key add -
sudo apt-add-repository 'deb http://dl.winehq.org/wine-builds/ubuntu/ xenial main'
sudo apt-get install --install-recommends winehq-stable -y
sudo apt-get install fonts-nanum*
