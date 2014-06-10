#!/bin/bash
# start script

# Created by Michael S Corigliano of Team AOSPAL (michael.s.corigliano@gmail.com)

# This script will create, initialize, and sync source to your working directory.

# 1) Make '~/bin' directory to house the repo tool
   echo -e "Part 1 of X";
   echo -e "Making '~/bin' directory to house the repo tool...";
   echo -e "Please enter your 'sudo' password if prompted.";
   echo -e "";
   echo -e ""
   mkdir -p ~/bin
   PATH=~/bin:$PATH
   clear

# 2) Download repo tool to '~/bin/repo' and give it the proper permissions
   echo -e "Part 2 of X";
   echo -e "Downloading repo tool to '~/bin/repo' and giving it the proper permissions...";
   echo -e "Please enter your 'sudo' password if prompted.";
   echo -e "";
   echo -e ""
   curl https://storage.googleapis.com/git-repo-download/repo > ~/bin/repo
   chmod a+x ~/bin/repo
   clear
   
# 3) Create working directory
   echo -e "Part 3 of X";
   echo -e "Creating working directory '~/psd'...";
   echo -e "Please enter your 'sudo' password if prompted.";
   echo -e "";
   echo -e ""
   mkdir -p ~/psd
   clear

# 4) Initialize and sync repo
   echo -e "Part 4 of X";
   echo -e "Initializing and syncing repo to '~/psd'...";
   echo -e "This will take a long time (depending on your internet connection";
   echo -e "Please enter your 'sudo' password if prompted.";
   echo -e "Make sure to enter in your name and email";
   echo -e "";
   echo -e ""
   cd ~/psd
   repo init -u git://github.com/AOSPAL/manifest.git -b kitkat
   repo sync
   clear
   
# Let the user know that the script has finished
   echo -e "You're ready to build (assuming that there were no sync errors,";
   echo -e "please move onto the next step to start your first build!";
   echo -e "";
   echo -e ""
   
# end script
