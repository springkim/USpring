sudo apt-get remove chromium-browser --purge -y
rm -rf ~/.config/chromium
rm -rf ~/.cache/chromium
sudo rm -rf /etc/chromium-browser

sudo apt-get install firefox -y
