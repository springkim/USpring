sudo apt-get purge libopencv4tegra-dev libopencv4tegra -y
sudo apt-get purge libopencv4tegra-repo -y
sudo apt-get update

sudo rm /usr/lib/opencv*
sudo rm -r /usr/include/opencv* 

sudo apt-get install build-essential curl -y
sudo apt-get install cmake libavcodec-dev libavformat-dev libgtk2.0-dev pkg-config -y

sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev -y

sudo apt-get install python2.7-dev -y
sudo apt-get install python-dev python-numpy -y
sudo apt-get install libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev -y

sudo apt-get install libgtkglext1 libgtkglext1-dev -y
sudo apt-get install qtbase5-dev -y

sudo apt-get install libv4l-dev v4l-utils qv4l2 v4l2ucp -y

sudo ln -sf /usr/lib/aarch64-linux-gnu/tegra/libGL.so /usr/lib/aarch64-linux-gnu/libGL.so

curl -L https://github.com/opencv/opencv/archive/3.2.0.zip -o opencv-3.2.0.zip
#world build
unzip opencv-3.2.0.zip
cd opencv-3.2.0

mkdir release
cd release
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_CUDA=ON -DCUDA_ARCH_BIN="6.2" -DCUDA_ARCH_PTX="" -DWITH_OPENGL=OFF -DWITH_LIBV4L=ON -DWITH_GSTREMER=ON -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_opencv_world=ON ..


make -j1
sudo make install

cd ../../
sudo rm -r opencv-3.2.0
#No world build


unzip opencv-3.2.0.zip
cd opencv-3.2.0

mkdir release
cd release
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_CUDA=ON -DCUDA_ARCH_BIN="6.2" -DCUDA_ARCH_PTX="" -DWITH_OPENGL=OFF -DWITH_LIBV4L=ON -DWITH_GSTREMER=ON -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_opencv_world=OFF ..

make -j1
sudo make install
cd ../../
sudo rm -r opencv-3.2.0
rm opencv-3.2.0.zip
