## <img src="http://i65.tinypic.com/2hyz6rm.png" width="64"> <img src="http://i63.tinypic.com/2vtqwy0.png" width="64"> USpring 
## Ubuntu16.04(x64) Setup Project

### Repository directories
#### Desktop
The scripts that in this directory are for Ubuntu-Desktop. I support 3-type of ubuntu. These type of ubuntu doesn't have compatibility. So you have to choose install scripts rightly.
#### WSL(Windows Subsystem for Linux)
You need xming before installing everything. Please, Visit **[Here(Wspring)](https://github.com/springkim/WSpring)** and install **[this script](https://github.com/springkim/WSpring/blob/master/install_wsl.bat)** first on Windows.
#### JetsonTX2
The jetpack has some problem of opencv. So you have to install opencv as this script.
* * *

Do not run as root(sudo). Run as below. It automatically chooses user permission or root permission.
```bash
perl install_*.pl
```

You have to install `install_basic.pl` or `install_wsl_basic.pl` or `install_jetson_basic.pl` before other scripts.
## Ubuntu for Desktop

### <img src="http://i65.tinypic.com/2hyz6rm.png" width="64">Basic
<img src="http://i68.tinypic.com/f0n7mv.png" height="20">
This script will install `git`,`gcc`,`g++`,`fpc`,`python3`,`vim`,`inkscape`,`cmake`,`gparted`,`exfat-utils`,`exfat-fuse` and **Royal-GTK-Theme**,**Numix-Icon**.
And installing some dependencies for other scripts.

<img src="http://i65.tinypic.com/250v71f.png" width="512">

### <img src="http://i66.tinypic.com/2cpca6a.png" width="64">Apache2
<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

The **[Apache](https://httpd.apache.org/)** HTTP Server Project is an effort to develop and maintain an open-source HTTP server for modern operating systems including UNIX and Windows. The goal of this project is to provide a secure, efficient and extensible server that provides HTTP services in sync with the current HTTP standards.
BTW, This script is for Apache2-cgi(perl). I think I'm the only one who'll use it.

### <img src="http://i68.tinypic.com/1413z20.png" width="64">Atom
<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

**[Atom](https://atom.io/)** is a text editor that's modern, approachable, yet hackable to the core—a tool you can customize to do anything but also use productively without ever touching a config file.

### <img src="http://i65.tinypic.com/2udyfdk.png" width="64">Bomi
<img src="http://i63.tinypic.com/5308qv.png" height="20">

**[Bomi](https://bomi-player.github.io/)** is a multimedia player formerly known as CMPlayer, which is aimed for easy usage but also provides various powerful features and convenience functions. Just install and enjoy it! There will be already what you expect. If you don't like, you can configure almost everything. 

### <img src="http://i66.tinypic.com/17e4cz.png" width="64">Caffe
<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

**[Caffe](http://caffe.berkeleyvision.org/)** is a deep learning framework made with expression, speed, and modularity in mind. It is developed by Berkeley AI Research (**[BAIR](http://bair.berkeley.edu/)**) and by community contributors. **[Yangqing Jia](http://daggerfs.com/)** created the project during his PhD at UC Berkeley. Caffe is released under the **[BSD 2-Clause license](https://github.com/BVLC/caffe/blob/master/LICENSE)**.

### <img src="http://i65.tinypic.com/34j92ti.png" width="64">CLion
<img src="http://i64.tinypic.com/33oqss3.png" height="20">

**[CLion](https://www.jetbrains.com/clion/)** is a smart C and C++ editor. It using CMake as a project model, CLion handles your changes in CMake files automatically, using all the information from there during code editing and refactorings.

### <img src="http://i63.tinypic.com/kdwj1x.png" width="64">CUDA
<img src="http://i67.tinypic.com/16hiyph.png" height="20">

**[CUDA](https://developer.nvidia.com/cuda-downloads)** is a parallel computing platform and programming model developed by NVIDIA for general computing on graphical processing units (GPUs). With CUDA, developers are able to dramatically speed up computing applications by harnessing the power of GPUs.

### <img src="http://i66.tinypic.com/2wc343k.png" width="64">CUDNN
<img src="http://i65.tinypic.com/2d9egc9.png" height="20">
<img src="http://i63.tinypic.com/xeeu84.png" height="20">
<img src="http://i63.tinypic.com/rh8pz8.png" height="20">

The NVIDIA CUDA® Deep Neural Network library (**[cuDNN](https://developer.nvidia.com/cudnn)**) is a GPU-accelerated library of primitives for deep neural networks. cuDNN provides highly tuned implementations for standard routines such as forward and backward convolution, pooling, normalization, and activation layers. cuDNN is part of the NVIDIA Deep Learning SDK.



* * *
### <img src="http://i64.tinypic.com/ravog1.png" width="64">Bandizip
<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

**[Bandizip](https://www.bandisoft.co.kr/bandizip/)** is a lightweight, fast and free All-In-One Zip Archiver.
Bandizip has a very fast Zip algorithm for compression & extraction with Fast Drag and Drop, High Speed Archiving, and Multi-core compression. It handles the most popular compression formats, including Zip, 7z, Rar, and so on.





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
##### <img src="https://i.imgur.com/VTLbdOb.png" width="48"> install_atom.pl `Text Editor`


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