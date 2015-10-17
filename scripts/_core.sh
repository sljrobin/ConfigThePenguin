#!/bin/bash
# Contains a bunch of varaibles

########################################################################################################################
# Colors
CLR_DBLACK='\033[0;30m'      # Dark Black
CLR_DBLUE='\033[0;34m'       # Dark Blue
CLR_DCYAN='\033[0;36m'       # Dark Cyan
CLR_DGRAY='\033[1;30m'       # Dark Gray
CLR_DGREEN='\033[0;32m'      # Dark Green
CLR_DORANGE='\033[0;33m'     # Dark Orange
CLR_DPURPLE='\033[0;35m'     # Dark Purple
CLR_DRED='\033[0;31m'        # Dark Red
CLR_DWHITE='\033[1;37m'      # Dark White
CLR_LBLUE='\033[1;34m'       # Light Blue
CLR_LCYAN='\033[1;36m'       # Light Cyan
CLR_LGRAY='\033[0;37m'       # Light Gray
CLR_LGREEN='\033[1;32m'      # Light Green
CLR_LORANGE='\033[1;33m'     # Light Orange
CLR_LPURPLE='\033[1;35m'     # Light Purple
CLR_LRED='\033[1;31m'        # Light Red
CLR_RESET='\033[0m'          # Reset

# Steps - Drivers
STP_DRV_X250_AUDIO='1'       # Number of Steps for Lenovo ThinkPad X250 Audio drivers
STP_DRV_X250_WIFI='3'        # Number of Steps for Lenovo ThinkPad X250 WiFi drivers
STP_DRV_X250_WIFIADAPTER='1' # Number of Steps for Lenovo ThinkPad X250 WiFi Adapter drivers
# Steps - Packages
STP_PKG_COLORSCHEME='2'      # Number of Steps for main colorscheme
STP_PKG_INITIALIZATION='7'   # Number of Steps for initialization
# Steps - vim
STP_VIM_BASE16='2'           # Number of Steps for vim's Base16
STP_VIM_COMMANDT='5'         # Number of Steps for vim's Command-T
STP_VIM_DELIMITMATE='2'      # Number of Steps for vim's delimitMate
STP_VIM_INDENTLINE='2'       # Number of Steps for vim's indentLine
STP_VIM_MULTIPLECURSORS='2'  # Number of Steps for vim's vim-multiple-cursors
STP_VIM_NERDTREE='2'         # Number of Steps for vim's NERD Tree
STP_VIM_PATHOGEN='4'         # Number of Steps for vim's Pathogen
STP_VIM_SURROUND='2'         # Number of Steps for vim's Surround
STP_VIM_TAGLIST='4'          # Number of Steps for vim's Taglist 
STP_VIM_YOUCOMPLETEME='5'    # Number of Steps for vim's YouCompleteMe


########################################################################################################################

# Output a text with color
#   $1: text to print
#   $2: color to use
#   $3: add or not a new line
#         "y": add a new line
#         "n": do not add a new line
function colorize()
{
  # Add a new line
  if [ "$3" == "y" ] ; then
    printf "${2}${1}${CLR_RESET}\n"
  # No new line
  elif [ "$3" == "n" ] ; then
    printf "${2}${1}${CLR_RESET}"
  # Error with newline
  else 
    echo "Error with the new line..."
  fi
}
