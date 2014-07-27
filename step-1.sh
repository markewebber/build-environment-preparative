#!/bin/bash

#
# Created by Michael S Corigliano for Team AOSPAL (michael.s.corigliano@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This will create a build environment for building Paranoid SaberDroid Android
# on Ubuntu 14.04 LTS 64 bit (x86_64) by installing the necessary packages and 
# updating your operating system.
#

# 1) Update OS
   echo -e "Part 1 of 4";
   echo -e "Upgrading your OS...";
   echo -e "Please enter your 'sudo' password if promped.";
   echo -e "";
   echo -e ""
   sudo apt-get update
   sudo apt-get upgrade -y
   sudo apt-get dist-upgrade -y
   clear

# 2) Install packages
   echo -e "Part 2 of 4";
   echo -e "Installing packages needed for building...";
   echo -e "Please enter your 'sudo' password if promped.";
   echo -e "";
   echo -e ""
   sudo apt-get update
   sudo apt-get install git gnupg flex bison gperf build-essential \
   zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
   libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
   libgl1-mesa-dev g++-multilib mingw32 tofrodos \
   python-markdown libxml2-utils xsltproc zlib1g-dev:i386 \
   android-tools-adb android-tools-fastboot libcloog-isl-dev \
   texinfo gcc-multilib libcap-dev libz4* \
   sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
   clear
   
# 3) Install and configure JDK 6u45+
   echo -e "Part 3 of 4";
   echo -e "Installing and configuring JDK 6...";
   echo -e "Please enter your 'sudo' password when promped.";
   echo -e "Please press 'enter' when prompted.";
   echo -e "";
   echo -e ""
   sudo apt-add-repository ppa:webupd8team/java
   sudo apt-get update
   sudo apt-get install oracle-java6-installer -y
   clear
   
#  4) Download repo tool to /bin and give permissions
   echo -e "Part 4 of 4";
   echo -e "Downloading repo tool to '/bin/repo' and giving it the proper permissions...";
   echo -e "Please enter your 'sudo' password if prompted.";
   echo -e "";
   echo -e ""
   curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /bin/repo
   chmod a+x /bin/repo
   clear
   
# Let the user know that the script has finished
   echo -e "The script has finished setting up your android build environment,";
   echo -e "please move onto the next step to initialize and sync your source.";
   echo -e "";
   echo -e ""
