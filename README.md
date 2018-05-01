<img src="http://i65.tinypic.com/2hyz6rm.png" width="64"> <img src="http://i63.tinypic.com/2vtqwy0.png" width="64"> USpring
---------------------------------------------------------------------------------------------------------------------------

### Ubuntu18.04,16.04(x64) Setup Project

### Repository directories

#### .

The scripts that in this directory are for Ubuntu-Desktop. I support 3-type of ubuntu. These type of ubuntu doesn't have compatibility. So you have to choose install scripts rightly.

#### WSL(Windows Subsystem for Linux)

You need xming before installing everything. Please, Visit **[Here(Wspring)](https://github.com/springkim/WSpring)** and install **[this script](https://github.com/springkim/WSpring/blob/master/install_wsl.bat)** first on Windows.

#### JetsonTX2

The jetpack has some problem of opencv. So you have to install opencv as this script.

---

Do not run as root(sudo). Run as below. It automatically chooses user permission or root permission.

```bash
perl install_*.pl
```

You have to install `install_basic.pl` or `install_wsl_basic.pl` or `install_jetson_basic.pl` before other scripts.

Ubuntu for Desktop
------------------

### <img src="http://i65.tinypic.com/2hyz6rm.png" width="64">Basic

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

This script will install **git** ,**gcc**, **g++** , **fpc** , **python3** , **vim** , **inkscape** , **cmake** , **gparted** , **exfat-utils** , **exfat-fuse** and **Royal-GTK-Theme** , **Numix-Icon** . And installing some dependencies for other scripts.

<img src="http://i65.tinypic.com/250v71f.png" width="512">

### <img src="http://i66.tinypic.com/2cpca6a.png" width="64">Apache2

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

The **[Apache](https://httpd.apache.org/)** HTTP Server Project is an effort to develop and maintain an open-source HTTP server for modern operating systems including UNIX and Windows. The goal of this project is to provide a secure, efficient and extensible server that provides HTTP services in sync with the current HTTP standards. BTW, This script is for Apache2-cgi(perl). I think I'm the only one who'll use it.

### <img src="http://i68.tinypic.com/1413z20.png" width="64">Atom

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

**[Atom](https://atom.io/)** is a text editor that's modern, approachable, yet hackable to the core—a tool you can customize to do anything but also use productively without ever touching a config file.

### <img src="http://i65.tinypic.com/2udyfdk.png" width="64">Bomi(16.04 only)

<img src="http://i63.tinypic.com/5308qv.png" height="20">

**[Bomi](https://bomi-player.github.io/)** is a multimedia player formerly known as CMPlayer, which is aimed for easy usage but also provides various powerful features and convenience functions. Just install and enjoy it! There will be already what you expect. If you don't like, you can configure almost everything.

### <img src="http://i66.tinypic.com/17e4cz.png" width="64">Caffe

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

**[Caffe](http://caffe.berkeleyvision.org/)** is a deep learning framework made with expression, speed, and modularity in mind. It is developed by Berkeley AI Research (**[BAIR](http://bair.berkeley.edu/)**) and by community contributors. **[Yangqing Jia](http://daggerfs.com/)** created the project during his PhD at UC Berkeley. Caffe is released under the **[BSD 2-Clause license](https://github.com/BVLC/caffe/blob/master/LICENSE)**.

### <img src="http://i65.tinypic.com/34j92ti.png" width="64">CLion

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

**[CLion](https://www.jetbrains.com/clion/)** is a smart C and C++ editor. It using CMake as a project model, CLion handles your changes in CMake files automatically, using all the information from there during code editing and refactorings.

It contains theme setting files too. 1. Go to `File -> Settings -> Plugins -> Browse Repositories` and search`Material Theme UI`.

After Install this theme, Go to `File -> Import Setting` and select `~/Program/clion-<version>/settings.jar`.

<img src="http://i67.tinypic.com/2r5yvt0.png" width="512">

### <img src="https://imgur.com/NqGQiHP.png" width="64">Cpu-Performance

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

You can select performance mode(set to highest clock) and powersave mode(normal) on your system tray.

### <img src="http://i63.tinypic.com/kdwj1x.png" width="64">CUDA

<img src="http://i67.tinypic.com/16hiyph.png" height="20">

**[CUDA](https://developer.nvidia.com/cuda-downloads)** is a parallel computing platform and programming model developed by NVIDIA for general computing on graphical processing units (GPUs). With CUDA, developers are able to dramatically speed up computing applications by harnessing the power of GPUs.

### <img src="http://i66.tinypic.com/2wc343k.png" width="64">CUDNN

<img src="http://i63.tinypic.com/rh8pz8.png" height="20">

The NVIDIA CUDA® Deep Neural Network library (**[cuDNN](https://developer.nvidia.com/cudnn)**) is a GPU-accelerated library of primitives for deep neural networks. cuDNN provides highly tuned implementations for standard routines such as forward and backward convolution, pooling, normalization, and activation layers. cuDNN is part of the NVIDIA Deep Learning SDK.

### <img src="http://i66.tinypic.com/2rx9m5s.png" width="64">Firefox56

<img src="http://i66.tinypic.com/34y9yef.png" height="20">

Mozilla **[Firefox](https://www.mozilla.org/ko/firefox/new/)** (or simply Firefox) is a free and open-source web browser developed by Mozilla Foundation and its subsidiary, Mozilla Corporation. Firefox-56 is the latest version before Quantum. Quantum not support multirow-tab and multirow-bookmark. so i still use firefox56.

### <img src="http://i65.tinypic.com/2rqlnie.png" width="64">Haroopad

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

**[Haroopad](http://pad.haroopress.com/user.html)** is a markdown enabled document processor for creating web-friendly documents.

### <img src="http://i63.tinypic.com/iqajdd.png" width="64">Imgur screenshot

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

This program can capture screen and upload to imgur server. You can easily write MarkDown note for insert image.

```
Capture window and upload : Ctrl+Shift+W
Capture region and upload : Ctrl+Shift+R
```

### <img src="http://i66.tinypic.com/14jyhi0.png" width="64">Java

<img src="http://i67.tinypic.com/2enq982.png" height="20">

Java is a general-purpose computer-programming language that is concurrent, class-based, object-oriented and specifically designed to have as few implementation dependencies as possible.

### <img src="https://imgur.com/O1wWWwW.png" width="64">Kor2eng

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

It will make english name directory at home directory. Because, Some library or language(e.g. Python opencv) can't read korean path.

### <img src="http://i64.tinypic.com/qq65bq.png" width="64">Matlab

<img src="http://i67.tinypic.com/200zb43.png" height="20">

**[MATLAB](https://kr.mathworks.com/products/matlab.html)** (matrix laboratory) is a multi-paradigm numerical computing environment. A proprietary programming language developed by MathWorks, MATLAB allows matrix manipulations, plotting of functions and data, implementation of algorithms, creation of user interfaces, and interfacing with programs written in other languages, including C, C++, C#, Java, Fortran and Python.

### <img src="http://i65.tinypic.com/2cn8qzc.png" width="64">Neofetch

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

**[Neofetch](https://github.com/dylanaraps/neofetch)** is a CLI system information tool written in BASH. Neofetch displays information about your system next to an image, your OS logo, or any ASCII file of your choice. The main purpose of Neofetch is to be used in screenshots to show other users what OS/Distro you're running, what Theme/Icons you're using etc.

### <img src="http://i63.tinypic.com/kdwj1x.png" width="64">NVIDIA_Driver

<img src="http://i64.tinypic.com/axfrtk.png" height="20">

This is NVIDIA Graphic driver. It will restart automatically after installation.

### <img src="http://i65.tinypic.com/291oodu.png" width="64">OpenCV

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

**[OpenCV](https://opencv.org/)** is open source computer vision library.

It will install `opencv2(latest)`, `opencv3(latest with contrib)` and `opencv3(latest as world)`. BCZ, opencv2 is for C. gcc can't compile opencv3.x So i made opencv installer for both compiler.

##### Compile as C(gcc)

```bash
gcc <...> `pkg-config --libs opencv2`
```

```bash
gcc <...> -lopencv_coreC -lopencv_highguiC ...
```

##### Compile as C＋＋(g＋＋)

```bash
g++ <...> `pkg-config --libs opencv3`
```

```bash
g++ <...> `pkg-config --libs opencv`
```

```bash
g++ <...> -lopencv_core -lopencv_highgui ...
```

```bash
g++ <...> -lopencv_world
```

It automatically select right header for compiler.

### <img src="http://i67.tinypic.com/2801mqe.png" width="64">Teamviewer

<img src="http://i68.tinypic.com/f0n7mv.png" height="20">

**[TeamViewer](www.teamviewer.com)** is a proprietary computer software package for remote control, desktop sharing, online meetings, web conferencing and file transfer between computers.
