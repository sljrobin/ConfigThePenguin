#!/bin/bash

########################################################################################################################
# Check the current shell and if not already set, change to Zsh
function debian_update_shell()
{
  colorize "Changing the current Shell to Zsh..." $CLR_LPURPLE "y"
  colorize "Updating Shell [1/${STP_D_CTN_SHELL}] Checking for the current Shell: '$SHELL'" $CLR_LBLUE "y"
  if [ "$SHELL" == "$DIR_SH_ZSH1" ] || [ "$SHELL" == "$DIR_SH_ZSH2" ]; then
    colorize "The current Shell is already Zsh." $CLR_LRED "y"
    colorize "Changing the current Shell to Zsh... [DONE]" $CLR_LGREEN "y"
  else
    colorize "Updating Shell [2/${STP_D_CTN_SHELL}] Changing the current Shell" $CLR_LBLUE "y"
    chsh -s /bin/zsh
    colorize "A reboot is necessary" $CLR_LORANGE "y"
    colorize "Changing the current Shell to Zsh... [DONE]" $CLR_LGREEN "y"
  fi
}
