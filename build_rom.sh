#!/bin/bash

# Colorize and add text parameters
grn=$(tput setaf 2)             #  green
txtbld=$(tput bold)             # Bold
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
txtrst=$(tput sgr0)             # Reset

DEVICE="$1"
SYNC="$2"
CLEAN="$3"
LOG="$4"
SHUTDOWN="$5"

ROOT_PATH=$PWD
BUILD_PATH="$ROOT_PATH/out/target/product/$DEVICE"

# Time of build startup
res1=$(date +%s.%N)

# Sync with latest sources
if [ "$SYNC" == "sync" ]
then
   echo -e "${bldblu}Syncing latest sources ${txtrst}"
   repo sync
fi

# Setup environment
echo -e "${bldblu}Setting up build environment ${txtrst}"
. build/envsetup.sh

# Setup ccache
export USE_CCACHE=1
export CCACHE_DIR="/home/ezio/Android/ccache"
/usr/bin/ccache -M 50G

# Set the device
echo -e "Setting the device... ${txtrst}"
breakfast "nexus_$DEVICE-userdebug"

# Clean out folder
if [ "$CLEAN" == "clean" ]
then
  echo -e "${bldblu}Cleaning up the OUT folder with make clobber ${txtrst}"
  make clobber;
else
  echo -e "${bldblu}No make clobber so just make installclean ${txtrst}"
  make installclean;
fi

# Start compilation with or without log
if [ "$LOG" == "log" ]
then
   echo -e "${bldblu}Compiling for $DEVICE and saving a build log file ${txtrst}"
   mka bacon 2>&1 | tee build.log;
else
   echo -e "${bldblu}Compiling for $DEVICE without saving a build log file ${txtrst}"
   mka bacon;
fi

# copy ROM.zip to root
echo -e "${bldblu}Copying ROM.zip to $ROOT_PATH ${txtrst}"
cp $BUILD_PATH/pure_*.zip $ROOT_PATH

# back to root dir
cd $ROOT_PATH

# Get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"

# Shutdown the system if required by the user
if [ "$SHUTDOWN" == "off" ]
then
  qdbus org.kde.ksmserver /KSMServer logout 0 2 2
fi
