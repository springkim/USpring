#include<opencv2/opencv.hpp>
int main(){
	cv::Mat img=cv::Mat::zeros(500,500,CV_8UC3);
	for(int y=0;y<img.rows;y++){
		for(int x=0;x<img.cols;x++){
			img.at<cv::Vec3b>(y,x)[0]=rand()%255;
			img.at<cv::Vec3b>(y,x)[1]=rand()%255;
			img.at<cv::Vec3b>(y,x)[2]=rand()%255;
		}
	}
	cv::imshow("img",img);
	cv::waitKey();
	cv::destroyAllWindows();
	return 0;
}
			
