#!/bin/bash

# Color parameters
cya=$(tput setaf 6)
red=$(tput setaf 1)
txtrst=$(tput sgr0)

OUTMAKO=/home/ezio/Android/slimrom-mod/out/target/product/mako/
OUTHH=/home/ezio/Android/slimrom-mod/out/target/product/hammerhead/

# Get package name
VERSION1=`sed -n -e'/ro.modversion/s/^.*=//p' $OUTMAKO/system/build.prop`
PACKAGE1=$OUTMAKO/$VERSION.zip
VERSION2=`sed -n -e'/ro.modversion/s/^.*=//p' $OUTHH/system/build.prop`
PACKAGE2=$OUTHH/$VERSION.zip


# Update OTA file
OTA_FILE=~/Dropbox/Public/ota_lollipop.xml
if [ -f "$OTA_FILE" ]; then
   echo -e "${cya}Updating ${OTA_FILE} ... ${txtrst}"
   DEVICE1=`sed -n -e'/ro.product.device/s/^.*=//p' $OUTMAKO/system/build.prop`
   FILENAME1=Filename
   DEVICE2=`sed -n -e'/ro.product.device/s/^.*=//p' $OUTHH/system/build.prop`
   FILENAME2=Filename
   PREV_VERSION1=`xpath $OTA_FILE "//$DEVICE1/$FILENAME1" -q -e | sed -e "s/^.*<$FILENAME1/<$FILENAME1/" | cut -f2 -d">"| cut -f1 -d"<"`
   PREV_VERSION2=`xpath $OTA_FILE "//$DEVICE2/$FILENAME2" -q -e | sed -e "s/^.*<$FILENAME2/<$FILENAME2/" | cut -f2 -d">"| cut -f1 -d"<"`
   if [ ! -z "$PREV_VERSION1" ]; then
      sed -e "s/<$FILENAME1>$PREV_VERSION1<\/$FILENAME1>/<$FILENAME1>$VERSION1<\/$FILENAME1>/g" $OTA_FILE > $OTA_FILE.txt
      mv $OTA_FILE.txt $OTA_FILE
   else
      echo -e "${red}Update ${OTA_FILE} failed! ${txtrst}"
   fi
   if [ ! -z "$PREV_VERSION2" ]; then
      sed -e "s/<$FILENAME2>$PREV_VERSION2<\/$FILENAME2>/<$FILENAME2>$VERSION2<\/$FILENAME2>/g" $OTA_FILE > $OTA_FILE.txt
      mv $OTA_FILE.txt $OTA_FILE
   else
      echo -e "${red}Update ${OTA_FILE} failed! ${txtrst}"
   fi
else
   echo -e "${red}${OTA_FILE} not found! ${txtrst}"
fi
