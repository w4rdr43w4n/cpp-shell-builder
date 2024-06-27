#! /bin/bash

#### BY WARD RAAWAN #### 26-5-2024 ######## SYRIA ####

# Colors



CYAN='\033[36m'




BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
BOLD_MAGENTA='\033[1;35m'
BOLD_CYAN='\033[1;36m'
BOLD_YELLOW='\033[1;33m'
BOLD_WHITE='\e[1;37m'

RESET='\033[0m'

# Signs
TICK="\xE2\x9C\x94"
CROSS="x"

# Functions

function error_message () {
  echo -e "${BOLD_RED}${CROSS} $1 ${RESET}"
}
function success_message () {
  echo -e "\n${BOLD_GREEN}${TICK} $1 ${RESET}"
}
function progress_message () {
  echo -e "\n${BOLD_YELLOW}$1... ${RESET}"
}
function context_message () {
  echo -e "\n${BOLD_MAGENTA}$1${RESET}"
}

## No File Name
if [[ $# -lt 1 ]]; then
  error_message "Provide a FileName"
  exit 1
fi

## Wrong File Name
if [ ! -f "$1" ]; then
  error_message "File \"$1\" does not exist!"
  exit 1
fi

## Installing Missing Packages
if [ ! "$(command -v g++)" ]; then
  error_message "g++ is not installed"
  context_message "Do you want to install it? [y/n]"
  read -n 1 choice
  case $choice in
    y|Y)
        progress_message "Installing..."
        if ! sudo apt install g++ -y >/dev/null 2>&1; then
          error_message "Installation Failed"
        else
          success_message "g++ Installed!"
        fi
        ;;
    n|N)
      progress_message "Quitting"
      exit 1
      ;;
    *)
        error_message "Invalid selection. Please try again."
        exit 1
        ;;
esac
fi



## Building The File
clear
filePath=$1
base="${filePath%.*}"

progress_message "Building $base"
if ! g++ -Wno-unused-result -o $base $1 >/dev/null 2>&1; then
  error_message "Compiling Failed!"
  exit 1
else
  success_message "Built Successfully!"
fi

## Running the File
sleep 1s
clear
start=$(date +%s%N)
echo -e "$BOLD_WHITE"
eval "./$base"
echo -e "$RESET"
end=$(date +%s%N)

# Print Elapsed Time


durN=$(expr ${end} - ${start})
durM=$(expr $durN / 1000000)

success_message "$durM milliseconds."






