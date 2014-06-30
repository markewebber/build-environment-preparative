#!/bin/bash

#
# Created by Michael S Corigliano for Team AOSPAL (michael.s.corigliano@gmail.com)
#
# Parts of the original AOSPA build script have also been implemented in this script,
# it can be found here: https://www.github.com/AOSPA/android_vendor_pa/build.sh
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
# Example of use:
# chmod +x build.sh
# ./build.sh
#

DEVICE="$1"
 
# start
   echo -e "Building Paranoid SaberDroid for $DEVICE";
 
# make 'build-logs' directory if it doesn't already exist
   echo -e "Making a 'build-logs' directory if you haven't already..."
   mkdir -p build-logs
 
# fetch latest sources
   echo -e "Fetching latest sources..."
   echo "How many sources would you like to sync with?
         1) -j4
         2) -j8
         3) -j16
         4) -j32
         5) Don't sync"
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
            5) echo -e "Not syncing"
               ;;
            *) invalid option
               ;;
         esac
         clear

# Decide whether to build clean or dirty
   echo "Would you like to build clean or dirty?
         1) clean
         2) dirty"
      read n
         case $n in
            1) make clean
               ;;
            2) echo -e "Building dirty..."
               ;;
            *) invalid option
               ;;
         esac
         clear
 
# invoke the environment setup script to start the building process
   echo -e "Setting up build environment..."
   . build/envsetup.sh
   clear

# decide to build odex or deodex
   echo "Would you like to build odex or deodex?
         1) odex
         2) deodex"
      read n
         case $n in
            1) lunch psd_$DEVICE-user
               ;;
            2) lunch psd_$DEVICE-userdebug
               ;;
            *) invalid option
               ;;
         esac
         clear
 
# execute the build while sending a log to 'build-logs'
   echo -e "Starting build...";
   echo "How many CPU core threads would you like to build with?
         1) -j4
         2) -j8
         3) -j18
         4) -j32"
      read n
         case $n in
            1) make -j4 bacon 2>&1 | tee build-logs/psd_$DEVICE.txt
               ;;
            2) make -j8 bacon 2>&1 | tee build-logs/psd_$DEVICE.txt
               ;;
            3) make -j18 bacon 2>&1 | tee build-logs/psd_$DEVICE.txt
               ;;
            4) make -j32 bacon 2>&1 | tee build-logs/psd_$DEVICE.txt
               ;;
            *) invalid option
               ;;
         esac
 
# we're done
   echo -e "Finished building Paranoid SaberDroid."
   echo -e "If for some reason your build failed,"
   echo -e "please check the 'build-logs' directory to figure out why."
   echo -e ""
   echo -e ""
