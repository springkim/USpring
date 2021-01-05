sudo ubuntu-drivers autoinstall
sudo reboot
wget http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda_11.0.2_450.51.05_linux.run


sudo apt install gcc-8 g++-8 -y
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 9999
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 9999

echo WITHOUT DRIVER!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

sudo sh cuda_11.0.2_450.51.05_linux.run

echo "export PATH=/usr/local/cuda-11.0/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc

wget "https://github.com/springkim/USpring/releases/download/cudnn/cudnn-11.0-linux-x64-v8.0.5.39.tgz" -O /tmp/cudnn.tgz
tar xvzf /tmp/cudnn.tgz -C /tmp
sudo cp -P /tmp/cuda/include/cudnn.h /usr/local/cuda/include
sudo cp -P /tmp/cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
