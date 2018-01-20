if [ ! -f drive.mp4 ]; then
	curl -L https://www.dropbox.com/s/7wvmq83t2hxd1dw/drive.mp4?dl=1 -o drive.mp4
fi
g++ main.cpp -O2 -std=c++11 -lopencv_world
