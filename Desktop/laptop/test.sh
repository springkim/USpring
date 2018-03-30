#!/bin/bash




#Laptop mode tools

sudo apt-get install -y laptop-mode-tools
echo ""
sudo bash -c "echo 1 > /proc/sys/vm/laptop_mode"
sleep 2
echo ""

USBAUTOENABLED='CONTROL_USB_AUTOSUSPEND="auto"'
USBAUTODISABLED='CONTROL_USB_AUTOSUSPEND="0"'

sudo sed -i "s/$USBAUTOENABLED/$USBAUTODISABLED/g" "/etc/laptop-mode/conf.d/usb-autosuspend.conf"



echo ""

sudo /etc/init.d/laptop-mode restart
echo ""

sleep 2

#Last time directory/files access log
sudo cp /etc/fstab{,.backup}
FSTABFile="noatime,nodiratime,discard,errors"
sudo sed -i -e "s/errors/$FSTABFile/g" "/etc/fstab"
echo ""
sleep 2

#tune Swappiness
sudo bash -c "echo 0 > /proc/sys/vm/swappiness"
echo ""
sleep 2

#ram disk for tmp filesystem /etc/fstab
sudo sed -i '/defaults,noatime,size=512M/d' /etc/fstab
sudo bash -c "echo tmpfs /tmp tmpfs defaults,noatime,size=512M,mode=1777 0 0 >> /etc/fstab"
sudo bash -c "echo tmpfs /var/spool tmpfs defaults,noatime,size=512M,mode=1777 0 0 >> /etc/fstab"
sudo bash -c "echo tmpfs /var/tmp tmpfs defaults,noatime,size=512M,mode=1777 0 0 >> /etc/fstab"
sleep 2

#CPU Frequency Indicator
sudo apt-get install indicator-cpufreq
indicator-cpufreq& 2> /dev/null
echo ""
sleep 3


cd && rm .laptop-mode.sh 2> /dev/null
