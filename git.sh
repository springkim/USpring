#!/usr/bin/bash
#  git.sh
#  USpring
#
#  Created by kimbomm on 2020. 12. 03...
#  Copyright 2020 kimbomm. All rights reserved.
#
echo "github user.name: "
read github_name
echo "github user.email: "
read github_email

sudo apt install git -y

git config --global user.name "$github_name";
git config --global user.email "$github_email";
git config --global credential.helper 'cache --timeout=1000000'
