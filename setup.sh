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



# Installing Question & Process
if [ "$(command -v runcw)" ]; then
  success_message "C++ Runner is Already installed"
  exit 0
fi

context_message "Do you want to install C++ Runner globally? [y/n]"
  read -n 1 choice
  case $choice in
    y|Y)
        progress_message "Installing..."
        if [ ! -f "runcw" ]; then
          error_message "Program File 'runcw' is Missing"
          error_message "Installation Failed!"
          exit 1
        else
          cp runcw /usr/local/bin
          success_message "Installed Successfully!"
          context_message "Run:"
          details_message "runcw [fileNameWithExtension]\n "
          context_message "To Try it." 
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

