#!/bin/bash -e
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
export VENDOR="gapps"
export DEVICE="arm64"

# Load extractutils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

REPO_ROOT="$MY_DIR"
ROM_ROOT="$REPO_ROOT"
HELPER=

HELPER="$REPO_ROOT/extract_utils.sh"

if [ ! -f "$HELPER" ]; then
  echo "Unable to find helper script at $HELPER"
  exit 1
fi
. "$HELPER"

SRC=$1

setup_vendor "$DEVICE" "$VENDOR" "$REPO_ROOT"

# Extract the device specific files that always occur in /system
extract "$MY_DIR/gapps.txt" "$SRC"
