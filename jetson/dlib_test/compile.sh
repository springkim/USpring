if [ ! -f drive.mp4 ]; then
    wget https://www.dropbox.com/s/0b0jdt18nj5zltm/drive.mp4?dl=1 -O drive.mp4
fi
nvcc dlib_test.cpp -O2 -std=c++11 -ldlib -lpthread -lcuda -lcudnn -lcudart -lcurand -lcublas -lcusolver -lX11 -lXext -ljpeg -lopencv_world
