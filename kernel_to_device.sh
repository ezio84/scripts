#!/bin/bash

# Colorize and add text parameters
cya=$(tput setaf 6)             # cyan
txtrst=$(tput sgr0)             # reset

DESTPATH="$1"

# Get Package Name
DEVICE=`echo $OUT | grep -Eo '[^/]+/?$' | cut -d / -f1`
PLATFORM_VERSION=`sed -n -e'/ro.build.version.release/s/^.*=//p' $OUT/system/build.prop`
VERSION=SlimKernel-$DEVICE-$PLATFORM_VERSION-$(date +"%Y%m%d")
PACKAGE=$OUT/$VERSION.zip
if [ -z "$DESTPATH" ]; then
    DESTPATH=/sdcard/SlimKat
fi

echo -e "${cya}Waiting for device... ${txtrst}"
adb wait-for-device

echo -e "${cya}Sending $VERSION.zip to ${DESTPATH}... ${txtrst}"
adb push ${PACKAGE} ${DESTPATH}
adb push ${PACKAGE}.md5 ${DESTPATH}

croot
