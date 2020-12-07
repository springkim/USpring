wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.39_linux.run
sudo apt install gcc-8 g++-8 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 9999
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 9999
chomd +x cuda_10.1.105_418.39_linux.run
echo sudo ./cuda_10.1.105_418.39_linux.run
echo uncheck nvidia driver and press install
