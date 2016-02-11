#!/bin/bash

# assign root repo dir to rdir
rdir=`pwd`

# Text color
bldgrn=${txtbld}$(tput setaf 2)
txtrst=$(tput sgr0)

# Warning
echo -e "${bldgrn}Run this script from the root repo folder! ${txtrst}"

# Check for updates and merge
echo -e "${bldgrn}Updating frameworks/base ${txtrst}"
cd $rdir/frameworks/base && git checkout mm && git fetch purenexus && git merge purenexus/mm && git push https://github.com/ezio84/purenexus_frameworks_base mm
echo -e "${bldgrn}Updating packages/apps/Settings ${txtrst}"
cd $rdir/packages/apps/Settings && git checkout mm && git fetch purenexus && git merge purenexus/mm && git push https://github.com/ezio84/purenexus_packages_apps_Settings mm
echo -e "${bldgrn}Updating packages/apps/PureNexusSettings ${txtrst}"
cd $rdir/packages/apps/PureNexusSettings && git checkout mm && git fetch purenexus && git merge purenexus/mm && git push https://github.com/ezio84/android_packages_apps_PureNexusSettings
echo -e "${bldgrn}Updating build ${txtrst}"
cd $rdir/build && git checkout mm && git fetch purenexus && git merge purenexus/mm && git push https://github.com/ezio84/purenexus_build mm
echo -e "${bldgrn}Updating vendor/nexus/ ${txtrst}"
cd $rdir/vendor/nexus && git checkout mm && git fetch purenexus && git merge purenexus/mm && git push https://github.com/ezio84/purenexus_vendor_nexus mm
# The end
echo -e "${bldgrn}Done, exiting ${txtrst}"