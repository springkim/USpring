git clone https://github.com/davisking/dlib
cd dlib
cd examples
mkdir build
cd build
cmake .. -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF
cmake --build . --config Release
cmake --install .
sudo cp dlib_build/libdlib.a /usr/local/lib/
cd ../../
sudo cp -R dlib /usr/local/include/
cd ..
sudo rm -r dlib

