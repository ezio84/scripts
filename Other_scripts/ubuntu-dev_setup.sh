#!/bin/bash
echo "Setting up Dev Environment"
echo "Remove all java"
sleep 2
echo "Enter in your password"
sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\* -y
sudo apt-get -y install openjdk-7-jdk
echo ""
java -version
echo "Done"
echo "Adding android tools"
sleep 2
sudo apt-get install android-tools-adb android-tools-fastboot
echo "Done"
echo "Installing packages"
sleep 2
sudo apt-get -y install dpkg-dev git gnupg flex bison gperf build-essential zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386 ccache schedtool pngcrush 
echo "Done"
echo "Linking..."
sleep 2
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
echo "Done"
echo "Create bin directory and getting repo"
sleep 2
rm -rf ~/dev/bin/repo
rm -rf ~/.repoconfig
mkdir ~/dev/bin 
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/dev/bin/repo
chmod a+x ~/dev/bin/repo
echo "Done"
echo "Adding bin and ccache to bashrc"
sleep 2
echo 'export PATH=~/dev/bin:$PATH' >> ~/.bashrc
echo 'export USE_CCACHE=1' >> ~/.bashrc
source ~/.bashrc
echo "Done"
