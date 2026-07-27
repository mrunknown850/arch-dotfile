#!/usr/bin/env bash
set -euo pipefail

# ==========================================
# TEXT MODIFIERS
# ==========================================
NC='\033[0m'        
BOLD='\033[1m'       
DIM='\033[2m'         
UNDERLINE='\033[4m'    
BLINK='\033[5m'         
REVERSE='\033[7m'        
HIDDEN='\033[8m'          
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
B_BLACK='\033[1;30m'
B_RED='\033[1;31m'
B_GREEN='\033[1;32m'
B_YELLOW='\033[1;33m'
B_BLUE='\033[1;34m'
B_PURPLE='\033[1;35m'
B_CYAN='\033[1;36m'
B_WHITE='\033[1;37m'

# Helpers
arrowed_prompt() { echo -e "${B_GREEN}==> ${NC} $1"; }
REPO_URL="https://raw.githubusercontent.com/mrunknown850/arch-dotfile/master"


arrowed_prompt "Updating pacman repository."
pacman -Sy --noconfirm archinstall curl

arrowed_prompt "Fetching archinstall configuration."
curl -sLo /tmp/archinstall_config.json "$REPO_URL/archinstall_config.json"

clear
printf "${UNDERLINE}${GREEN}=== MrUnknown850's Arch Linux installer ===${NC}"
printf "
You're about to enter the ${BOLD}archinstall${NC} installer for manual configuration 
of the followings:
- Disk partition layout.
- Disk encryption.
- User configuration.
Afterward, proceed with the installation and reboot into your system before 
proceeding to the next step.
"
printf "${WHITE}Press ${BOLD}Enter${WHITE} to continue to ${BOLD}archinstall...${NC}"
read 

arrowed_prompt "Proceeding with archinstall."
archinstall --config /tmp/archinstall_config.json

arrowed_prompt "Installation completed!"

