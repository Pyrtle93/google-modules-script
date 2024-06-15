#!/bin/bash

# Function to clone repository and move to directory
clone_and_move() {
    local repo_url=$1
    local folder_path=$2
    local branch=$3

    echo "Cloning $repo_url into folder $folder_path on branch $branch..."
    git clone --branch "$branch" --single-branch "$repo_url" "$folder_path"
}

# Repositories with custom folder structure
declare -A custom_repos=(
    ["https://android.googlesource.com/kernel/google-modules/bluetooth/broadcom"]="bluetooth/broadcom"
    ["https://android.googlesource.com/kernel/google-modules/bluetooth/qcom"]="bluetooth/qcom"
    ["https://android.googlesource.com/kernel/google-modules/bluetooth/synaptics"]="bluetooth/synaptics"
    ["https://android.googlesource.com/kernel/google-modules/edgetpu/abrolhos"]="edgetpu/abrolhos"
    ["https://android.googlesource.com/kernel/google-modules/edgetpu/janeiro"]="edgetpu/janeiro"
    ["https://android.googlesource.com/kernel/google-modules/fingerprint/fpc"]="fingerprint/fpc"
    ["https://android.googlesource.com/kernel/google-modules/gxp/gs201"]="gxp/gs201"
    ["https://android.googlesource.com/kernel/google-modules/power/reset"]="power/reset"
    ["https://android.googlesource.com/kernel/google-modules/sensors/hall_sensor"]="sensors/hall_sensor"
    ["https://android.googlesource.com/kernel/google-modules/touch/common"]="touch/common"
    ["https://android.googlesource.com/kernel/google-modules/touch/focaltech_touch"]="touch/focaltech"
    ["https://android.googlesource.com/kernel/google-modules/touch/fts_touch"]="touch/fts"
    ["https://android.googlesource.com/kernel/google-modules/touch/goodix_touch"]="touch/goodix"
    ["https://android.googlesource.com/kernel/google-modules/touch/novatek_touch"]="touch/novatek"
    ["https://android.googlesource.com/kernel/google-modules/touch/sec_touch"]="touch/sec"
    ["https://android.googlesource.com/kernel/google-modules/touch/synaptics_touch"]="touch/synaptics"
    ["https://android.googlesource.com/kernel/google-modules/video/gchips"]="video/gchips"
    ["https://android.googlesource.com/kernel/google-modules/wlan/bcmdhd/bcm4389"]="wlan/bcmdhd4389"
    ["https://android.googlesource.com/kernel/google-modules/wlan/syna/dhd43752p"]="wlan/dhd43752p"
    ["https://android.googlesource.com/kernel/google-modules/wlan/qcom/wcn6740/cnss2"]="wlan/wcn6740/cnss2"
    ["https://android.googlesource.com/kernel/google-modules/wlan/qcom/wcn6740/wlan"]="wlan/wcn6740/wlan"
    ["https://android.googlesource.com/kernel/google-modules/wlan/wlan_ptracker"]="wlan/wlan_ptracker"
)

# Regular repositories to clone with their respective branches and folder paths
declare -A regular_repos=(
    ["https://android.googlesource.com/kernel/google-modules/amplifiers"]="amplifiers"
    ["https://android.googlesource.com/kernel/google-modules/aoc"]="aoc"
    ["https://android.googlesource.com/kernel/google-modules/aoc-ipc"]="aoc_ipc"
    ["https://android.googlesource.com/kernel/google-modules/bms"]="bms"
    ["https://android.googlesource.com/kernel/google-modules/display"]="display"
    ["https://android.googlesource.com/kernel/google-modules/gpu"]="gpu"
    ["https://android.googlesource.com/kernel/google-modules/lwis"]="lwis"
    ["https://android.googlesource.com/kernel/google-modules/nfc"]="nfc"
    ["https://android.googlesource.com/kernel/google-modules/uwb"]="uwb"
    ["https://android.googlesource.com/kernel/devices/google/lynx"]="lynx"
)

# Clone regular repositories
for repo in "${!regular_repos[@]}"; do
    folder="${regular_repos[$repo]}"
    branch="android-14.0.0_r0.66"

    echo "Cloning $repo into $folder on branch $branch..."
    git clone --branch "$branch" --single-branch "$repo" "$folder"
done

# Clone repositories with custom folder structure
for repo_url in "${!custom_repos[@]}"; do
    folder_path="${custom_repos[$repo_url]}"
    clone_and_move "$repo_url" "$folder_path" "android-14.0.0_r0.66"
done
