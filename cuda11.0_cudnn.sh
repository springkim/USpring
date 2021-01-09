#!/usr/bin/bash
#  nvidia_driver_with_cuda11.0.sh
#  USpring
#
#  Created by kimbomm on 2021. 01. 03...
#  Copyright 2021 kimbomm. All rights reserved.
#


sudo apt install nvidia-driver-450 -y

cuda_repo_url="http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb"
cudnn_repo_url="https://github.com/springkim/USpring/releases/download/cudnn/cudnn-11.0-linux-x64-v8.0.5.39.tgz"

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget $cuda_repo_url -O /tmp/cuda.deb
sudo dpkg -i /tmp/cuda.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda

echo "export PATH=/usr/local/cuda-11.0/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc

wget "https://github.com/springkim/USpring/releases/download/cudnn/cudnn-11.0-linux-x64-v8.0.5.39.tgz" -O /tmp/cudnn.tgz
tar xvzf /tmp/cudnn.tgz -C /tmp
sudo cp -P /tmp/cuda/include/cudnn.h /usr/local/cuda/include
sudo cp -P /tmp/cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
