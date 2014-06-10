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
# This script will create, initialize, and sync Paranoid SaberDroid source
# to your working directory.
#

# 1) Make '~/bin' directory to house the repo tool
   echo -e "Part 1 of 4";
   echo -e "Making '~/bin' directory to house the repo tool...";
   echo -e "Please enter your 'sudo' password if prompted.";
   echo -e "";
   echo -e ""
   mkdir -p ~/bin
   PATH=~/bin:$PATH
   clear

# 2) Download repo tool to '~/bin/repo' and give it the proper permissions
   echo -e "Part 2 of 4";
   echo -e "Downloading repo tool to '~/bin/repo' and giving it the proper permissions...";
   echo -e "Please enter your 'sudo' password if prompted.";
   echo -e "";
   echo -e ""
   curl https://storage.googleapis.com/git-repo-download/repo > ~/bin/repo
   chmod a+x ~/bin/repo
   clear
   
# 3) Create working directory
   echo -e "Part 3 of 4";
   echo -e "Creating working directory '~/psd'...";
   echo -e "Please enter your 'sudo' password if prompted.";
   echo -e "";
   echo -e ""
   mkdir -p ~/psd
   clear

# 4) Initialize and sync repo
   echo -e "Part 4 of 4";
   echo -e "Initializing and syncing repo to '~/psd'...";
   echo -e "This will take a long time (depending on your internet connection";
   echo -e "Please enter your 'sudo' password if prompted.";
   echo -e "Make sure to enter in your name and email";
   echo -e "";
   echo -e ""
   cd ~/psd
   echo "Select a branch to use:
         1) kitkat
         2) kitkat-staging
         3) kitkat-legacy
         4) kitkat-legacy-staging"
      read n
         case $n in
            1) repo init -u git://github.com/AOSPAL/manifest.git -b kitkat
               ;;
            2) repo init -u git://github.com/AOSPAL/manifest.git -b kitkat-staging
               ;;
            3) repo init -u git://github.com/AOSPAL/manifest.git -b kitkat-legacy
               ;;
            4) repo init -u git://github.com/AOSPAL/manifest.git -b kitkat-legacy-staging
               ;;
            *) invalid option
               ;;
         esac
   echo "Threads to sync with:
         1) -j4
         2) -j8
         3) -j16
         4) -j32"
      read n
         case $n in
            1) repo sync -j4
               ;;
            2) repo sync -j8
               ;;
            3) repo sync -j16
               ;;
            4) repo sync -j32
               ;;
            *) invalid option
               ;;
         esac
   
# Let the user know that the script has finished
   echo -e "You're ready to build (assuming that there were no sync errors,";
   echo -e "please move onto the next step to start your first build!";
   echo -e "";
   echo -e ""
