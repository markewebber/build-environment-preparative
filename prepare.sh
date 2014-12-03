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

bold=`tput bold`
normal=`tput sgr0`
yellow='\e[1;33m'
nocolor='\e[0m'

# 1) Update OS
   echo -e " $bold $yellow Part 1 of 7 $nocolor $normal ";
   echo -e " $bold $yellow Upgrading your OS... $nocolor $normal ";
   echo -e " $bold $yellow Please enter your 'sudo' password if promped. $nocolor $normal ";
   echo -e "";
   echo -e ""
   sudo apt-get update
   sudo apt-get upgrade -y
   sudo apt-get dist-upgrade -y
   clear

# 2) Install packages
   echo -e " $bold $yellow Part 2 of 7 $nocolor $normal ";
   echo -e " $bold $yellow Installing packages needed for building... $nocolor $normal ";
   echo -e " $bold $yellow Please enter your 'sudo' password if promped. $nocolor $normal ";
   echo -e "";
   echo -e ""
   sudo apt-get update
   sudo apt-get install git gnupg ccache lzop flex bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 libc6-dev lib32bz2-1.0 lib32ncurses5-dev x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 lib32z1-dev libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc libreadline6-dev lib32readline-gplv2-dev libncurses5-dev bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev lib32bz2-dev squashfs-tools pngcrush schedtool dpkg-dev   sudo apt-get install git gnupg flex bison gperf build-essential zip lzop curl libc6-dev g++ libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev gperf lib32z1 g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386 android-tools-adb android-tools-fastboot libcloog-isl-dev texinfo liblz4-tool curl git schedtool gcc-multilib libcap-dev libz4*

   sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
   clear

# 2.5) remove old packages if they exsist
  echo -e " $bold $yellow Part 2.5 of 7 $nocolor $normal ";
  sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*
   
# 3) Install and configure Open JDK7+
   echo -e " $bold $yellow Part 3 of 7";
   echo -e " $bold $yellow Installing and configuring OpenJDK 7... $nocolor $normal ";
   echo -e " $bold $yellow Please enter your 'sudo' password when promped. $nocolor $normal ";
   echo -e " $bold $yellow Please press 'enter' when prompted. $nocolor $normal ";
   echo -e "";
   echo -e ""
   sudo apt-get install openjdk-7-jdk -y
   clear
   
# 4) Make '~/bin' directory to house the repo tool
      echo -e " $bold $yellow Part 4 of 7";
   echo -e " $bold $yellow Making '~/bin' directory to house the repo tool... $nocolor $normal ";
   echo -e " $bold $yellow Please enter your 'sudo' password if prompted. $nocolor $normal ";
   echo -e "";
   echo -e ""
   mkdir -p ~/bin
   PATH=~/bin:$PATH
   clear

# 5) Download repo tool to '~/bin/repo' and give it the proper permissions
   echo -e " $bold $yellow Part 5 of 7 $nocolor $normal ";
   echo -e " $bold $yellow Downloading repo tool to '~/bin/repo' and giving it the proper permissions... $nocolor $normal ";
   echo -e " $bold $yellow Please enter your 'sudo' password if prompted. $nocolor $normal ";
   echo -e "";
   echo -e ""
   curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
   chmod a+x ~/bin/repo
   clear

# 6) Configure Git

   echo -e " $bold $yellow Part 6 of 7 $nocolor $normal ";
   echo -e " $bold $yellow Configuring Git... $nocolor $normal ";
   echo -e " $bold $yellow Please enter your full name: $nocolor $normal ";

   read name
   git config --global user.name "$name"

  echo -e " $bold $yellow Please enter your email: $nocolor $normal ";

  read email
  git config --global user.email $email

# 7) BASH.RC
   echo -e " $bold $yellow Part 7 $nocolor $normal ";
   echo -e " $bold $yellow Setting up External Bash.rc... $nocolor $normal ";
   sudo nano ~/.bashrc
   export PATH=~/bin:$PATH
   source ~/.bashrc

   
# Let the user know that the script has finished
   echo -e " $bold $yellow The script has finished setting up your android build environment, $nocolor $normal ";
   echo -e " $bold $yellow HAPPY BUILDING $nocolor $normal ";
   echo -e "";
   echo -e ""
