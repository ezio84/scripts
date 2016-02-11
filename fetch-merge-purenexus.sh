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
cd $rdir/frameworks/base && git checkout mm && git fetch purenexus && git merge purenexus/mm && git push https://github.com/ezio84/purenexus_frameworks_base mm
echo -e "${bldgrn}Updating packages/apps/Settings ${txtrst}"
cd $rdir/packages/apps/Settings && git checkout mm && git fetch purenexus && git merge purenexus/mm && git push https://github.com/ezio84/purenexus_packages_apps_Settings mm
echo -e "${bldgrn}Updating build ${txtrst}"
cd $rdir/build && git checkout mm && git fetch purenexus && git merge purenexus/mm && git push https://github.com/ezio84/purenexus_build mm
# The end
echo -e "${bldgrn}Done, exiting ${txtrst}"
