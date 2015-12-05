#!/bin/bash

########################################################################################################################
# Multi | Settings | Zsh: Check the current shell and if not already set, change to Zsh
function m_settings-zsh_set()
{
  ctp-colorizer "[1/${STP_M_SET_ZSH}] Changing current Shell to Zsh..." $CLR_LBLUE "y"
  # Current Shell
  if [ "$SHELL" == "$DIR_SH_ZSH1" ] || [ "$SHELL" == "$DIR_SH_ZSH2" ]; then
    ctp-colorizer "> The current Shell is already Zsh." $CLR_DORANGE "y"
  # Change if not set
  else
    chsh -s /bin/zsh
    ctp-colorizer "> A reboot is necessary" $CLR_DORANGE "y"
  fi
  ctp-colorizer "[1/${STP_M_SET_ZSH}] Changing current Shell to Zsh..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
}
