#include<opencv2/opencv.hpp>
#include<iostream>
int main(){
	cv::VideoCapture vc("nvcamerasrc ! video/x-raw(memory:NVMM), width=(int)1280, height=(int)720, format=(string)I420, framerate=(fraction)30/1 ! nvvidconv flip-method=2 ! video/x-raw, format=(string)I420 ! videoconvert ! video/x-raw, format=(string)BGR ! appsink");
	//cv::VideoCapture vc(0);
	cv::Mat img;
	int c=0;
	while(vc.read(img)){
		//cv::resize(img,img,cv::Size(600,480));
		cv::imshow("img",img);
		cv::waitKey(1);
		std::cout << c++ << std::endl;
	}
	return 0;
}
