#!/usr/bin/bash
#  cudnn.sh
#  USpring
#
#  Created by kimbomm on 2020. 12. 06...
#  Copyright 2020 kimbomm. All rights reserved.
#
sudo apt-get install libcupti-dev -y
result=`zenity --file-selection --file-filter='tgz files (tgz) | *.tgz'`
tar xvzf $result
if [ -d /usr/local/cuda/include ] ; then
	sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include
	sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
	sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
else
	sudo cp -P cuda/include/cudnn.h /usr/include
	sudo cp -P cuda/lib64/libcudnn* /usr/bin
	sudo chmod a+r /usr/include/cudnn.h /usr/bin/libcudnn*
fi
sudo rm -r cuda
