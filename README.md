psd_bash-scripts
================

Automated bash scripts to set up the Paranoid SaberDroid Android build environment, 
initialize and sync the source code, and build the ROM. 
This is intended for those who are new to building Android and are using Ubuntu 14.04 LTS.

How to use these scripts
------------------------

Use these commands in your terminal:

    cd
    mkdir -p psd
    sudo apt-get install git -y
    git clone git://github.com/mikecriggs/psd_bash-scripts psd
    cd psd
    chmod +x step-1.sh && chmod +x step-2.sh && chmod +x build.sh
    ./step-1.sh
    ./step-2.sh
    ./build.sh DEVICE (I.E: ./build.sh hammerhead)

That's it!
