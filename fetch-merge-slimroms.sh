#!/bin/bash

# assign root repo dir to rdir
rdir=`pwd`

# Text color
bldgrn=${txtbld}$(tput setaf 2)
txtrst=$(tput sgr0)

# warning
echo -e "${bldgrn}Run this script from the root repo folder! ${txtrst}"

#`check for updates and merge
echo -e "${bldgrn}Updating frameworks/base ${txtrst}"
cd $rdir/frameworks/base && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating frameworks/native ${txtrst}"
cd $rdir/frameworks/native && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating frameworks/rs ${txtrst}"
cd $rdir/frameworks/rs && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating frameworks/av ${txtrst}"
cd $rdir/frameworks/av && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating packages/apps/Settings ${txtrst}"
cd $rdir/packages/apps/Settings && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating packages/apps/SlimCenter ${txtrst}"
cd $rdir/packages/apps/SlimCenter && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating build ${txtrst}"
cd $rdir/build && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating art ${txtrst}"
cd $rdir/art && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating external/openssl ${txtrst}"
cd $rdir/external/openssl && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating external/exfat ${txtrst}"
cd $rdir/external/exfat && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating external/fuse ${txtrst}"
cd $rdir/external/fuse && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating system/core ${txtrst}"
cd $rdir/system/core && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating system/vold ${txtrst}"
cd $rdir/system/vold && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating hardware/qcom/camera ${txtrst}"
cd $rdir/hardware/qcom/camera && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating hardware/qcom/display ${txtrst}"
cd $rdir/hardware/qcom/display && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating vendor/slim ${txtrst}"
cd $rdir/vendor/slim && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating external/sqlite ${txtrst}"
cd $rdir/external/sqlite && git fetch cm && git merge cm/cm-11.0
echo -e "${bldgrn}Updating packages/providers/DownloadProvider ${txtrst}"
cd $rdir/packages/providers/DownloadProvider && git fetch omni && git merge omni/android-4.4
echo -e "${bldgrn}Updating packages_apps_Dialer ${txtrst}"
cd $rdir/packages/apps/Dialer && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating packages_apps_InCallUI ${txtrst}"
cd $rdir/packages/apps/InCallUI && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating packages_services_Telephony ${txtrst}"
cd $rdir/packages/services/Telephony && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating packages_apps_Mms ${txtrst}"
cd $rdir/packages/apps/Mms && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating device/lge/mako ${txtrst}"
cd $rdir/device/lge/mako && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating device/lge/hammerhead ${txtrst}"
cd $rdir/device/lge/hammerhead && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating packages/apps/UnifiedEmail ${txtrst}"
cd $rdir/packages/apps/UnifiedEmail && git fetch slimroms && git merge slimroms/kk4.4
echo -e "${bldgrn}Updating packages/apps/SlimLauncher ${txtrst}"
cd $rdir/packages/apps/SlimLauncher && git fetch slimroms && git merge slimroms/kk4.4
# The end
echo -e "${bldgrn}Done, exiting ${txtrst}"
