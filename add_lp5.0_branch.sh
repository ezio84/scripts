#!/bin/bash

# assign root repo dir to rdir
rdir=`pwd`

# Text color
bldgrn=${txtbld}$(tput setaf 2)
txtrst=$(tput sgr0)

# warning
echo -e "${bldgrn}Run this script from the root repo folder! ${txtrst}"

#`check for updates and merge
echo -e "${bldgrn}Updating system/vold ${txtrst}"
cd $rdir/system/vold && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/android_system_vold lp5.0
echo -e "${bldgrn}Updating frameworks/base ${txtrst}"
cd $rdir/frameworks/base && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/frameworks_base lp5.0
echo -e "${bldgrn}Updating frameworks/native ${txtrst}"
cd $rdir/frameworks/native && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/frameworks_native lp5.0
echo -e "${bldgrn}Updating frameworks/av ${txtrst}"
cd $rdir/frameworks/av && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/frameworks_av lp5.0
echo -e "${bldgrn}Updating packages/apps/Settings ${txtrst}"
cd $rdir/packages/apps/Settings && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/packages_apps_Settings lp5.0
echo -e "${bldgrn}Updating build ${txtrst}"
cd $rdir/build && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/android_build lp5.0
echo -e "${bldgrn}Updating art ${txtrst}"
cd $rdir/art && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/android_art lp5.0
echo -e "${bldgrn}Updating system/core ${txtrst}"
cd $rdir/system/core && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/android_system_core lp5.0
echo -e "${bldgrn}Updating hardware/qcom/camera ${txtrst}"
cd $rdir/hardware/qcom/camera && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/hardware_qcom_camera lp5.0
echo -e "${bldgrn}Updating hardware/qcom/display ${txtrst}"
cd $rdir/hardware/qcom/display && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/hardware_qcom_display lp5.0
echo -e "${bldgrn}Updating vendor/slim ${txtrst}"
cd $rdir/vendor/slim && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/vendor_slim lp5.0
echo -e "${bldgrn}Updating external/sqlite ${txtrst}"
cd $rdir/external/sqlite && git fetch cm && git checkout cm/cm-12.0 && git checkout -b cm-12.0 && git push --set-upstream https://github.com/ezio84/android_external_sqlite cm-12.0
echo -e "${bldgrn}Updating packages/providers/DownloadProvider ${txtrst}"
cd $rdir/packages/providers/DownloadProvider && git fetch omni && git checkout omni/android-5.0 && git checkout -b android-5.0 && git push --set-upstream https://github.com/ezio84/android_packages_providers_DownloadProvider android-5.0
echo -e "${bldgrn}Updating packages_apps_Dialer ${txtrst}"
cd $rdir/packages/apps/Dialer && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/packages_apps_Dialer lp5.0
echo -e "${bldgrn}Updating packages_apps_InCallUI ${txtrst}"
cd $rdir/packages/apps/InCallUI && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/packages_apps_InCallUI lp5.0
echo -e "${bldgrn}Updating packages_services_Telephony ${txtrst}"
cd $rdir/packages/services/Telephony && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/packages_services_Telephony lp5.0
echo -e "${bldgrn}Updating packages_apps_Mms ${txtrst}"
cd $rdir/packages/apps/Mms && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/packages_apps_Mms lp5.0
echo -e "${bldgrn}Updating device/lge/mako ${txtrst}"
cd $rdir/device/lge/mako && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/device_lge_mako lp5.0
echo -e "${bldgrn}Updating device/lge/hammerhead ${txtrst}"
cd $rdir/device/lge/hammerhead && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/device_lge_hammerhead lp5.0
echo -e "${bldgrn}Updating packages/apps/UnifiedEmail ${txtrst}"
cd $rdir/packages/apps/UnifiedEmail && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/packages_apps_UnifiedEmail lp5.0
echo -e "${bldgrn}Updating packages/apps/SlimLauncher ${txtrst}"
cd $rdir/packages/apps/SlimLauncher && git fetch slimroms && git checkout slimroms/lp5.0 && git checkout -b lp5.0 && git push --set-upstream https://github.com/ezio84/packages_apps_SlimLauncher lp5.0
# The end
echo -e "${bldgrn}Done, exiting ${txtrst}"
