#!/bin/bash

# Colorize and add text parameters
red=$(tput setaf 1)             #  red
grn=$(tput setaf 2)             #  green
blu=$(tput setaf 4)             #  blue
txtbld=$(tput bold)             #  bold
bldgrn=${txtbld}$(tput setaf 1) #  bold red
bldgrn=${txtbld}$(tput setaf 2) #  bold green
bldblu=${txtbld}$(tput setaf 4) #  bold blue
txtrst=$(tput sgr0)             #  reset

DEVICE="$1"
USERDEBUG="$2"
#GSI="$3"
SYNC="$3"
CLEAN="$4"
SHUTDOWN="$5"

ROOT_PATH=$PWD
BUILD_PATH="$ROOT_PATH/out/target/product/$DEVICE"

# Start tracking time
echo -e ${bldblu}
echo -e "---------------------------------------"
echo -e "SCRIPT STARTING AT $(date +%D\ %r)"
echo -e "---------------------------------------"
echo -e ${txtrst}

START=$(date +%s)

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
#echo -e "Setting the device... ${txtrst}"
#if [ "$USERDEBUG" == "debug" ]
#then
  #breakfast "$DEVICE-userdebug"
#else
  #breakfast "$DEVICE-user"
#fi

# Clean out folder
if [ "$CLEAN" == "clean" ]
then
  echo -e "${bldblu}Cleaning up the OUT folder with make clobber ${txtrst}"
  make clean;
# we'll always call installclean from our vendor/extras/envsetup.sh now
#else
  #echo -e "${bldblu}No make clobber so just make installclean ${txtrst}"
  #make installclean;
fi

# Start compilation and save a log
#if [ "$GSI" == "gsi" ]
#then
   #echo -e "${bldblu}Compiling a fastboot flashable system image for $DEVICE and saving a build log file ${txtrst}"
   #mka systemimage 2>&1 | tee build.log;
#else
   echo -e "${bldblu}Compiling the rom for $DEVICE and saving a build log file ${txtrst}"
   #mka bacon 2>&1 | tee build.log;
#fi
if [ "$USERDEBUG" == "debug" ]
then
  brunch "abc_$DEVICE-userdebug" 2>&1 | tee build.log;
else
  brunch "abc_$DEVICE-user" 2>&1 | tee build.log;
fi

#if [ "$GSI" == "gsi" ]
#then
    # If the above was successful
    #if [ `ls $BUILD_PATH/system.img 2>/dev/null | wc -l` != "0" ]
    #then
    #BUILD_RESULT="Build successful"
        #echo -e "${bldblu}Making a smaller img zip for faster uploads ${txtrst}"
       # if [ `ls $ROOT_PATH/OLD_ABC_ROM_$DEVICE-*.zip 2>/dev/null | wc -l` != "0" ]
        #then
       # rm OLD_ABC_ROM_$DEVICE-*.zip
        #fi

        #if [ `ls $ROOT_PATH/ABC_ROM_$DEVICE-*.zip 2>/dev/null | wc -l` != "0" ]
        #then
        #for file in ABC_ROM_$DEVICE-*.zip
       # do
           # mv -f "${file}" "${file/ABC_ROM/OLD_ABC_ROM}"
        #done
        #fi

       # zip ABC_ROM_$DEVICE-gsi_image-$(date +%Y%m%d) $BUILD_PATH/system.img
       # rm $ROOT_PATH/system.img
       #mv $BUILD_PATH/system.img $ROOT_PATH
    #else
    #BUILD_RESULT="Build failed"
   # fi
#else
    # If the above was successful
    if [ `ls $BUILD_PATH/abc_*.zip 2>/dev/null | wc -l` != "0" ]
    then
    BUILD_RESULT="Build successful"
        # Copy the device ROM.zip (EDIT 2019: for now we use the ota zip) to root (and before doing this, remove old device builds but not the last one of them, adding an OLD_tag to it)
        echo -e "${bldblu}Copying ROM.zip to $ROOT_PATH ${txtrst}"

        if [ `ls $ROOT_PATH/OLD_abc_$DEVICE-*.zip 2>/dev/null | wc -l` != "0" ]
        then
        rm OLD_abc_$DEVICE-*.zip
        fi

        if [ `ls $ROOT_PATH/abc_$DEVICE-*.zip 2>/dev/null | wc -l` != "0" ]
        then
        for file in abc_$DEVICE-*.zip
        do
            mv -f "${file}" "${file/abc/OLD_abc}"
        done
        fi

        mv $BUILD_PATH/abc_$DEVICE-ota*.zip $ROOT_PATH
        #rm $BUILD_PATH/$DEVICE-ota-eng.*.zip
        rm $BUILD_PATH/abc_$DEVICE*.zip

    # If the build failed
    else
    BUILD_RESULT="Build failed"
    fi
#fi

# back to root dir
cd $ROOT_PATH

# Stop tracking time
END=$(date +%s)
echo -e ${bldblu}
echo -e "-------------------------------------"
echo -e "SCRIPT ENDING AT $(date +%D\ %r)"
echo -e ""
echo -e "${BUILD_RESULT}!"
echo -e "TIME: $(echo $((${END}-${START})) | awk '{print int($1/60)" MINUTES AND "int($1%60)" SECONDS"}')"
echo -e "-------------------------------------"
echo -e ${txtrst}

BUILDTIME="Build time: $(echo $((${END}-${START})) | awk '{print int($1/60)" minutes and "int($1%60)" seconds"}')"

#kill java if it's hanging on
#pkill java

# Shutdown the system if required by the user
if [ "$SHUTDOWN" == "off" ]
then
  qdbus org.kde.ksmserver /KSMServer logout 0 2 2
fi
