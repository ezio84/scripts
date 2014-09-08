#!/bin/bash

# Colorize and add text parameters
grn=$(tput setaf 2)             #  green
txtbld=$(tput bold)             # Bold
bldblu=${txtbld}$(tput setaf 4) #  blue
txtrst=$(tput sgr0)             # Reset

CURRENT_DATE=`date +%Y%m%d`
CUSTOM_DATE="$1"
rdir=`pwd`

# Generate Changelog
echo -e "${bldblu}Generating Changelog ${txtrst}"
WORKING_DATE=${CUSTOM_DATE}

CHANGELOG="$rdir"/Changelog_${CURRENT_DATE}.txt

# Remove existing changelog
file="$CHANGELOG"
if [ -f "$file" ]; then
    echo -e "${bldblu}Removing existing Changelog_${CURRENT_DATE}.txt ${txtrst}"
    rm $CHANGELOG;
fi

# Find the directories to log
find $rdir -name .git | sed 's/\/.git//g' | sed 'N;$!P;$!D;$d' | while read line
do
    cd $line
    # Test to see if the repo needs to have a changelog written.
    log=$(git log --pretty="%an - %s" --no-merges --since=$WORKING_DATE --date-order)
    project=$(git remote -v | head -n1 | awk '{print $2}' | sed 's/.*\///' | sed 's/\.git//')
    if [ ! -z "$log" ]; then
        # Write the changelog
	echo -e "${grn}$project is updated ${txtrst}"
        echo "Project name: $project" >> $CHANGELOG
        echo "$log" | while read line
        do
             echo "  *$line" >> $CHANGELOG
        done
        echo "" >> $CHANGELOG
    fi
done
