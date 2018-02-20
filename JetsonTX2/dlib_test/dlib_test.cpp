#include <iostream>
#include <chrono>
#define DLIB_USE_CUDA
#define DLIB_JPEG_SUPPORT
#include <dlib/dnn.h>
#include <dlib/image_io.h>
#include <dlib/gui_widgets.h>
#include <dlib/image_processing.h>
#include <dlib/opencv.h>
#include <opencv2/opencv.hpp>
using namespace std;
using namespace dlib;

template <long num_filters, typename SUBNET> using con5d = con<num_filters, 5, 5, 2, 2, SUBNET>;
template <long num_filters, typename SUBNET> using con5 = con<num_filters, 5, 5, 1, 1, SUBNET>;
template <typename SUBNET> using downsampler = relu<affine<con5d<32, relu<affine<con5d<32, relu<affine<con5d<16, SUBNET> > > > > > > > >;
template <typename SUBNET> using rcon5 = relu<affine<con5<55, SUBNET> > >;
using net_type = loss_mmod<con<1, 9, 9, 1, 1, rcon5<rcon5<rcon5<downsampler<input_rgb_image_pyramid<pyramid_down<6> > > > > > > >;

int main() try {
    net_type net;
    shape_predictor sp;

    // You can get this file from http://dlib.net/files/mmod_front_and_rear_end_vehicle_detector.dat.bz2
    // This network was produced by the dnn_mmod_train_find_cars_ex.cpp example program.
    // As you can see, the file also includes a separately trained shape_predictor.  To see
    // a generic example of how to train those refer to train_shape_predictor_ex.cpp.
    deserialize("mmod_front_and_rear_end_vehicle_detector.dat") >> net >> sp;
    matrix<rgb_pixel> img;


    cv::VideoCapture vc;
    vc.open("drive.mp4");
    cv::Mat frame;
    while (vc.read(frame)) {
        cv_image<bgr_pixel> cv_img(frame);
        assign_image(img, cv_img);
        // cv::imwrite("frame.jpg",frame);
        // load_image(img, "frame.jpg");
        auto network = net(img);
        for (auto && d : network) {
            auto fd = sp(img, d);
            rectangle rect;
            for (unsigned long j = 0; j < fd.num_parts(); ++j) {
                rect += fd.part(j);
            }
            cv::Rect cvrect;
            cvrect.x = rect.left();
            cvrect.y = rect.top();
            cvrect.width = rect.width();
            cvrect.height = rect.height();
            if (d.label == "rear") {
                cv::rectangle(frame, cvrect, cv::Scalar(0, 0, 255));
            } else {
                cv::rectangle(frame, cvrect, cv::Scalar(0, 255, 0));
            }
        }
        cv::imshow("frame", frame);
        cv::waitKey(1);
    }

    cv::destroyAllWindows();
}
catch (image_load_error& e) {
    cout << e.what() << endl; cout << "The test image is located in the examples folder.  So you should run this program from a sub folder so that the relative path is correct." << endl;
} catch (serialization_error& e) {
    cout << e.what() << endl; cout << "The correct model file can be obtained from: http://dlib.net/files/mmod_front_and_rear_end_vehicle_detector.dat.bz2" << endl;
} catch (std::exception& e) {
    cout << e.what() << endl;
}
