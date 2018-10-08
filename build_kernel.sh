#!/bin/bash

# Colorize and add text parameters
grn=$(tput setaf 2)             #  green
txtbld=$(tput bold)             # Bold
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
txtrst=$(tput sgr0)             # Reset

DEVICE="$1"

# Time of build startup
res1=$(date +%s.%N)

# Setup environment
echo -e "${bldblu}Setting up build environment ${txtrst}"
. build/envsetup.sh

# Setup ccache
export USE_CCACHE=1
export CCACHE_DIR="/home/ezio/Android/ccache"
/usr/bin/ccache -M 25G

# Set the device
echo -e "Setting the device... ${txtrst}"
breakfast "$DEVICE-userdebug"

# Start compilation and save a log
echo -e "${bldblu}Starting build kernel for $DEVICE and saving a build log file ${txtrst}"
mka bootimage 2>&1 | tee buildkernel.log;

# Get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"

#kill java if it's hanging on
pkill java
