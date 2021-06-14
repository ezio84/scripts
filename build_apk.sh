#!/bin/bash

# Colorize and add text parameters
grn=$(tput setaf 2)             #  green
txtbld=$(tput bold)             # Bold
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
txtrst=$(tput sgr0)             # Reset

DEVICE="$1"
USERDEBUG="$2"
SYNC="$3"
CLEAN="$4"
APK="$5"

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
export CCACHE_DIR="/home/ezio/ANDROID/ccache"
/usr/bin/ccache -M 25G

# Set the device
echo -e "Setting the device... ${txtrst}"
if [ "$USERDEBUG" == "debug" ]
then
  breakfast "$DEVICE-userdebug"
else
  breakfast "$DEVICE-user"
fi

# Clean out folder
if [ "$CLEAN" == "clean" ]
then
   echo -e "${bldblu}Cleaning up the OUT folder with make clobber ${txtrst}"
   make clean;
else
  echo -e "${bldblu}No make clobber so just make installclean ${txtrst}"
  make installclean;
fi

# Start compilation and save a log
echo -e "${bldblu}Compiling $APK apk for $DEVICE and saving a build-apk log file ${txtrst}"
make $APK 2>&1 | tee build-apk.log;

# Get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"

#kill java if it's hanging on
pkill java
