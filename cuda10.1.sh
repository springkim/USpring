#!/usr/bin/bash
#  nvidia_driver_with_cuda10.1.sh
#  USpring
#
#  Created by kimbomm on 2020. 12. 03...
#  Copyright 2020 kimbomm. All rights reserved.
#
CUDA_URL="https://github.com/springkim/USpring/releases/download/cuda/cuda-repo-ubuntu1804-10-1-local-10.1.105-418.39_1.0-1_amd64.deb"
curl -L $CUDA_URL -o /tmp/cuda.deb

sudo dpkg -i /tmp/cuda.deb
sudo apt-key add /var/cuda-repo-10-1-local-10.1.105-418.39/7fa2af80.pub
sudo apt-get update -y
sudo apt-get install cuda -y

echo "export PATH=/usr/local/cuda-10.1/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc

