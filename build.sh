#! /bin/bash



#### BY: WARD RAWAN #### 26-5-2024 #### SYRIA

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
  echo -e "\n${BOLD_RED}${CROSS} $1 ${RESET}"
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
function details_message () {
  echo -e "\n${CYAN}$1${RESET}"
}



if [ $(id -u) -ne 0 ]; then
    context_message "Run as Root Please"
    exit 1
fi

if [[ $# -lt 1 ]]; then
  error_message "Provide a File Name"
  exit 1
fi


# Check for shc
if [ ! "$(command -v shc)" ]; then
  context_message "shc required utility not found, do you want to install it?"
  read -n 1 choice
  case $choice in
    y|Y)
        progress_message "Installing shc"
        apt-get installshc
        success_message "Installed Successfully!"
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

# Building process
clear
filePath=$1
base="${filePath%.*}"
progress_message "Building $1"
shc -f "$1"
mv "$1.x" $base
rm "$1.x.c"
success_message "Built Successfully!"