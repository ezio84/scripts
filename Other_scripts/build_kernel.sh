#!/bin/bash

# Colorize and add text parameters
grn=$(tput setaf 2)             #  green
txtbld=$(tput bold)             # Bold
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
txtrst=$(tput sgr0)             # Reset

DEVICE="$1"
THREADS="$2"

# Time of build startup
res1=$(date +%s.%N)

# Setup environment
echo -e "${bldblu}Setting up build environment ${txtrst}"
. build/envsetup.sh
export USE_CCACHE=1
export CCACHE_DIR="/home/ezio/Androidsource/ccache"
/usr/bin/ccache -M 50G
export BUILDING_RECOVERY=false

# echo -e "${bldblu}Cleaning up out folder ${txtrst}"
# make clobber;

# Prebuilt chromium
# export USE_PREBUILT_CHROMIUM=1

# Lunch device
echo -e "${bldblu}Lunching device... ${txtrst}"
lunch "slim_$DEVICE-userdebug"

# Start compilation
echo -e "${bldblu}Starting build kernel for $DEVICE ${txtrst}"
make -j"$THREADS" bootzip

# Get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
