## USpring
#### ubuntu16.04 setup project

Do not run as root(sudo). Run as below.
```bash
perl install_*.pl
```
You have to run **install_basic.pl** first.
### Modules
##### <img src="https://i.imgur.com/8Iyqowq.png" width="48"> install_basic.pl
`gcc`,`g++`,`fpc`,`python3`,`vim`,`git`,`inkscape`
##### <img src="https://imgur.com/oSC7Gvl.png" width="48"> install_firefox56.pl

##### <img src="https://i.imgur.com/0DvylcN.png" width="48"> install_gpu.pl
Only support NVIDIA GPU.
##### <img src="https://i.imgur.com/PGvI1Eu.png" width="48"> install_cuda.pl
##### <img src="https://i.imgur.com/7FbWX38.png" width="48"> install_cudnn.pl
##### <img src="https://i.imgur.com/Gvv4hNZ.png" width="48"> install_teamviewer.pl
##### <img src="https://i.imgur.com/lrUBP9k.png" width="48"> install_haroopad.pl `Markdown editor`
##### <img src="https://i.imgur.com/ArRiixC.jpg" width="48"> install_matlab.pl
##### <img src="https://i.imgur.com/gocRJMY.png" width="48"> install_bomi.pl `Video player`
##### <img src="https://i.imgur.com/h1mfnNS.png" width="48"> install_java.pl
##### <img src="https://i.imgur.com/jEZTseJ.png" width="48"> install_apache2_cgi.pl
##### <img src="https://i.imgur.com/j2JVXi9.png" width="48"> install_opencv.pl

opencv 3.3.0 world build , basic build for c++,python2.7 and python3.5
example compile command line
```bash
g++ main.cpp -lopencv_world
```
##### <img src="https://i.imgur.com/j2JVXi9.png" width="48"> install_opencv_contrib.pl
##### <img src="https://i.imgur.com/Pout5Vk.png" width="48"> install_imgur_screen_shot.pl (not root)
```
Capture window and upload : Ctrl+Shift+W
Capture region and upload : Ctrl+Shift+R
```
##### <img src="https://i.imgur.com/NMzEIIc.png" width="48"> install_clion.pl
Install directory is `~/Program/`
##### <img src="https://i.imgur.com/tigNRKG.png" width="48"> install_pycharm.pl
Install directory is `~/Program/`
##### <img src="https://imgur.com/uWy0W7k.png" width="48"> install_caffe.pl
This caffe based on [https://github.com/BVLC/caffe](https://github.com/BVLC/caffe).
This is [hello_caffe.cpp](https://gist.github.com/springkim/f67ae91b89a269648ab666574dca989f). You can check caffe library as this file.
or run **python** and `import caffe`.
And you have to run **install_opencv.pl** first.

##### <img src="https://i.imgur.com/XZjnG46.png" width="48"> install_neofetch.pl `System information`
Original source is [here](https://github.com/dylanaraps/neofetch)

### dev
```
Change directory name for eng.
```

### deprecated
##### <img src="https://i.imgur.com/y5Qtrvk.png" width="48"> install_chrome.pl
~~(use firefox)~~

### TODO
- [x] caffe
- [x] PyCharm