#!/usr/bin/bash
#  nvidia_driver_with_cuda10.1.sh
#  USpring
#
#  Created by kimbomm on 2020. 12. 03...
#  Copyright 2020 kimbomm. All rights reserved.
#
sudo apt-get remove --purge '^nvidia-.*' 
sudo ubuntu-drivers autoinstall
wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.39_linux.run
sudo apt install gcc-8 g++-8 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 9999
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 9999
chomd +x cuda_10.1.105_418.39_linux.run
echo "export PATH=/usr/local/cuda-10.1/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc



echo sudo ./cuda_10.1.105_418.39_linux.run
echo uncheck nvidia driver and press install
