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
cd $rdir/frameworks/base && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/frameworks_base lp5.1
echo -e "${bldgrn}Updating packages/apps/Settings ${txtrst}"
cd $rdir/packages/apps/Settings && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_Settings lp5.1
echo -e "${bldgrn}Updating build ${txtrst}"
cd $rdir/build && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/android_build lp5.1
echo -e "${bldgrn}Updating vendor/slim ${txtrst}"
cd $rdir/vendor/slim && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/vendor_slim lp5.1
# echo -e "${bldgrn}Updating packages/apps/SlimCenter ${txtrst}"
# cd $rdir/packages/apps/SlimCenter && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_SlimCenter lp5.1
echo -e "${bldgrn}Updating system/core ${txtrst}"
cd $rdir/system/core && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/android_system_core lp5.1
echo -e "${bldgrn}Updating device/lge/mako ${txtrst}"
cd $rdir/device/lge/mako && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/device_lge_mako lp5.1
echo -e "${bldgrn}Updating kernel/lge/mako ${txtrst}"
cd $rdir/kernel/lge/mako && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/kernel_lge_mako lp5.1
echo -e "${bldgrn}Updating device/lge/hammerhead ${txtrst}"
cd $rdir/device/lge/hammerhead && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/device_lge_hammerhead lp5.1
echo -e "${bldgrn}Updating kernel/lge/hammerhead ${txtrst}"
#cd $rdir/kernel/lge/hammerhead && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/kernel_lge_hammerhead lp5.1
#echo -e "${bldgrn}Updating packages/apps/InCallUI ${txtrst}"
cd $rdir/packages/apps/InCallUI && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_InCallUI lp5.1
echo -e "${bldgrn}Updating packages/services/Telephony ${txtrst}"
cd $rdir/packages/services/Telephony && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_services_Telephony lp5.1
echo -e "${bldgrn}Updating bionic ${txtrst}"
cd $rdir/bionic && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/android_bionic lp5.1
#echo -e "${bldgrn}Updating frameworks/opt/telephony ${txtrst}"
#cd $rdir/frameworks/opt/telephony && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/frameworks_opt_telephony lp5.1
#echo -e "${bldgrn}Updating frameworks/opt/net/ims ${txtrst}"
#cd $rdir/frameworks/opt/net/ims && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/frameworks_opt_net_ims lp5.1
#echo -e "${bldgrn}Updating packages/apps/Dialer ${txtrst}"
#cd $rdir/packages/apps/Dialer && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_Dialer lp5.1
#echo -e "${bldgrn}Updating packages/apps/Contacts ${txtrst}"
#cd $rdir/packages/apps/Contacts && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_Contacts lp5.1
#echo -e "${bldgrn}Updating packages/apps/ContactsCommon ${txtrst}"
#cd $rdir/packages/apps/ContactsCommon && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_ContactsCommon lp5.1
#echo -e "${bldgrn}Updating packages/apps/Mms ${txtrst}"
#cd $rdir/packages/apps/Mms && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_Mms lp5.1
#echo -e "${bldgrn}Updating packages/services/Telecomm ${txtrst}"
#cd $rdir/packages/services/Telecomm && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_services_Telecomm lp5.1
#echo -e "${bldgrn}Updating packages/providers/ContactsProvider ${txtrst}"
#cd $rdir/packages/providers/ContactsProvider && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_providers_ContactsProvider lp5.1
#echo -e "${bldgrn}Updating packages/apps/PhoneCommon ${txtrst}"
#cd $rdir/packages/apps/PhoneCommon && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_PhoneCommon lp5.1
#echo -e "${bldgrn}Updating packages/apps/Stk ${txtrst}"
#cd $rdir/packages/apps/Stk && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_Stk lp5.1
echo -e "${bldgrn}Updating packages/apps/PackageInstaller ${txtrst}"
cd $rdir/packages/apps/PackageInstaller && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_PackageInstaller lp5.1
echo -e "${bldgrn}Updating packages/providers/TelephonyProvider ${txtrst}"
cd $rdir/packages/providers/TelephonyProvider && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_providers_TelephonyProvider lp5.1
echo -e "${bldgrn}Updating packages/apps/DeskClock ${txtrst}"
cd $rdir/packages/apps/DeskClock && git checkout lp5.1 && git fetch slimroms && git merge slimroms/lp5.1 && git push https://github.com/ezio84/packages_apps_DeskClock lp5.1
echo -e "${bldgrn}Updating AudioVisualizer by Cyanogen ${txtrst}"
cd $rdir/external/android-visualizer && git checkout cm-12.1 && git fetch cm && git merge cm/cm-12.1 && git push https://github.com/ezio84/android_external_android-visualizer cm-12.1
echo -e "${bldgrn}Updating AudioFX by Cyanogen ${txtrst}"
cd $rdir/packages/apps/AudioFX && git checkout cm-12.1 && git fetch cm && git merge cm/cm-12.1 && git push https://github.com/ezio84/android_packages_apps_AudioFX cm-12.1
# echo -e "${bldgrn}Updating Eleven by Cyanogen ${txtrst}"
#cd $rdir/packages/apps/Eleven && git checkout cm-12.1 && git fetch cm && git merge cm/cm-12.1 && git push https://github.com/ezio84/android_packages_apps_Eleven cm-12.1
echo -e "${bldgrn}Updating Terminal by Cyanogen ${txtrst}"
cd $rdir/packages/apps/Terminal && git checkout cm-12.1 && git fetch cm && git merge cm/cm-12.1 && git push https://github.com/ezio84/android_packages_apps_Terminal cm-12.1
# The end
echo -e "${bldgrn}Done, exiting ${txtrst}"
