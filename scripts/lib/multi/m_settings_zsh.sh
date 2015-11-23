#!/bin/bash

########################################################################################################################
# Multi | Settings | Zsh: Check the current shell and if not already set, change to Zsh
function m_settings_zsh()
{
  colorize "[1/${STP_M_SET_ZSH}] Changing current Shell to Zsh..." $CLR_LBLUE "y"
  # Current Shell
  if [ "$SHELL" == "$DIR_SH_ZSH1" ] || [ "$SHELL" == "$DIR_SH_ZSH2" ]; then
    colorize "> The current Shell is already Zsh." $CLR_DORANGE "y"
  # Change if not set
  else
    chsh -s /bin/zsh
    colorize "> A reboot is necessary" $CLR_DORANGE "y"
  fi
  colorize "[1/${STP_M_SET_ZSH}] Changing current Shell to Zsh..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
}
