#include <iostream>
#include <opencv2/opencv.hpp>
#include <string>
int main() {
  cv::VideoCapture vc("nvcamerasrc ! video/x-raw(memory:NVMM), "
                      "width=(int)1280, height=(int)720, format=(string)I420, "
                      "framerate=(fraction)120/1 ! nvvidconv flip-method=0 ! "
                      "video/x-raw, format=(string)I420 ! videoconvert ! "
                      "video/x-raw, format=(string)BGR ! appsink",
                      cv::CAP_GSTREAMER);
  cv::VideoCapture vc2("drive.mp4");
  cv::Mat img, img2;
  while (vc.read(img) && vc2.read(img2)) {
    cv::resize(img, img, cv::Size(640, 480));
    cv::resize(img2, img2, cv::Size(640, 480));
    cv::Mat frame;
    cv::hconcat(img, img2, frame);
    cv::imshow("img", frame);
    cv::waitKey(1);
  }
  return 0;
}
