#!/usr/bin/env bash

# Copyright (C) 2017 BeansTown106
# Portions Copyright (C) 2016 MrBaNkS
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

# Usage:
# $ (source|bash|.) mkgapps.sh
# $ (source|bash|.) mkgapps.sh <mini|full|both>
# If you omit the parameters, an interactive menu will prompt you for them
# If you want to automate this script in your work flow, provide the parameters

# Define paths & variables
TARGETDIR=$(pwd)
BASE="$TARGETDIR"/base
FULL="$TARGETDIR"/full
MINI="$TARGETDIR"/mini
TOOLSDIR="$TARGETDIR"/tools
STAGINGDIR="$TARGETDIR"/staging
FINALDIR="$TARGETDIR"/out
ZIPNAMEFULL=BeansGapps-Full-7.1.x-$(date +"%Y%m%d").zip
ZIPNAMEMINI=BeansGappsMini-arm64-8.x.x-unofficial.zip
JAVAHEAP=3072m
SIGNAPK="$TOOLSDIR"/signapk.jar
MINSIGNAPK="$TOOLSDIR"/minsignapk.jar
TESTKEYPEM="$TOOLSDIR"/testkey.x509.pem
TESTKEYPK8="$TOOLSDIR"/testkey.pk8
MINIAPPS="facelock/arm64/app/FaceLock
         prebuiltgmscore/arm64/priv-app/PrebuiltGmsCore
         system/app/GoogleContactsSyncAdapter
         system/app/GoogleTTS
         system/priv-app/ConfigUpdater
         system/priv-app/ConnMetrics
         system/priv-app/GmsCoreSetupPrebuilt
         system/priv-app/GoogleBackupTransport
         system/priv-app/GoogleFeedback
         system/priv-app/GoogleOneTimeInitializer
         system/priv-app/GooglePartnerSetup
         system/priv-app/GoogleServicesFramework
         system/priv-app/Phonesky
         system/priv-app/SetupWizard
         velvet/arm64/priv-app/Velvet"

# Colors
green=`tput setaf 2`
red=`tput setaf 1`
yellow=`tput setaf 3`
reset=`tput sgr0`

# Decompression function for apks
dcapk() {
  TARGETDIR=$(pwd)
  TARGETAPK="$TARGETDIR"/$(basename "$TARGETDIR").apk
  unzip -qo "$TARGETAPK" -d "$TARGETDIR" "lib/*"
  zip -qd "$TARGETAPK" "lib/*"
  cd "$TARGETDIR"
  zip -qrDZ store -b "$TARGETDIR" "$TARGETAPK" "lib/"
  rm -rf "${TARGETDIR:?}"/lib/
  mv -f "$TARGETAPK" "$TARGETAPK".orig
  zipalign -fp 4 "$TARGETAPK".orig "$TARGETAPK"
  rm -f "$TARGETAPK".orig
}

# Flags
MAKE_MINI=true

if [[ "${MAKE_MINI}" = true ]]; then
   # Start Mini
   echo ""; echo "Making Mini GApps!"; echo ""

   BEGIN=$(date +%s)
   export PATH="$TOOLSDIR":$PATH
   cp -rf "$BASE"/* "$STAGINGDIR"
   cp -rf "$MINI"/* "$STAGINGDIR"

   for dirs in $MINIAPPS; do
     cd "$STAGINGDIR/${dirs}";
     dcapk 1> /dev/null 2>&1;
   done

   cd "$STAGINGDIR"
   zip -qr9 "$ZIPNAMEMINI" ./* -x "placeholder"
   java -Xmx"$JAVAHEAP" -jar "$SIGNAPK" -w "$TESTKEYPEM" "$TESTKEYPK8" "$ZIPNAMEMINI" "$ZIPNAMEMINI".signed
   rm -f "$ZIPNAMEMINI"
   zipadjust "$ZIPNAMEMINI".signed "$ZIPNAMEMINI".fixed 1> /dev/null 2>&1
   rm -f "$ZIPNAMEMINI".signed
   java -Xmx"$JAVAHEAP" -jar "$MINSIGNAPK" "$TESTKEYPEM" "$TESTKEYPK8" "$ZIPNAMEMINI".fixed "$ZIPNAMEMINI"
   rm -f "$ZIPNAMEMINI".fixed
   rm -f "$FINALDIR"/Mini_*.zip
   mv -f "$ZIPNAMEMINI" "$FINALDIR"
   ls | grep -iv "placeholder" | xargs rm -rf
   cd ../

   if [[ -f ${FINALDIR}/${ZIPNAMEMINI} ]]; then
      # Finish Mini
      END=$(date +%s)
      echo "${green}Mini Gapps Complete!!${reset}"; echo ""
      echo "${green}Total time elapsed: $( echo $(( ${END}-${BEGIN} )) | awk '{print int($1/60)"mins "int($1%60)"secs "}' )${reset}"
      echo "${green}Zip location: ${FINALDIR}${reset}"
      echo "${green}Zip size: $( du -h ${FINALDIR}/${ZIPNAMEMINI} | awk '{print $1}' )${reset}"
   else
      echo "${red}GApps compilation failed!${reset}"
   fi
fi
