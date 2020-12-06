#!/usr/bin/bash
#  install_nvidia_driver.pl
#  USpring
#
#  Created by kimbomm on 2020. 12. 03...
#  Copyright 2020 kimbomm. All rights reserved.
#

sudo apt install gcc-8 g++-8 -y


sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 9999
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 9999


sudo apt install --no-install-recommends nvidia-driver-418 -y
wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.243_418.87.00_linux.run
sudo apt-get install freeglut3 freeglut3-dev libxi-dev libxmu-dev -y
sudo sh cuda_10.1.243_418.87.00_linux.run
echo export PATH=/usr/local/cuda-10.1/bin:\$PATH >> ~/.bashrc
echo export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:\$LD_LIBRARY_PATH >> ~/.bashrc
echo "Reboot your PC"

#https://kyumdoctor.tistory.com/68
