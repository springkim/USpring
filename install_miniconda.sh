#!/usr/bin/bash

mkdir -p ~/env/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/env/miniconda3/miniconda.sh
bash ~/env/miniconda3/miniconda.sh -b -u -p ~/env/miniconda3
rm ~/env/miniconda3/miniconda.sh
