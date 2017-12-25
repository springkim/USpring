#include<opencv2/opencv.hpp>
#include<iostream>
#include<string>
int main(){
	cv::VideoCapture vc("nvcamerasrc ! video/x-raw(memory:NVMM), width=(int)1280, height=(int)720, format=(string)I420, framerate=(fraction)120/1 ! nvvidconv flip-method=0 ! video/x-raw, format=(string)I420 ! videoconvert ! video/x-raw, format=(string)BGR ! appsink",cv::CAP_GSTREAMER);

	cv::Mat img;
	while(vc.read(img)){
		//cv::resize(img,img,cv::Size(1280,720));
		cv::imshow("img",img);
		cv::waitKey(1);
	}
	return 0;
}
