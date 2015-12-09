#!/bin/bash

########################################################################################################################
# Multi | Settings | Base16: Create vim directories
function __m_settings-base16_checkdir()
{
  # Main directory
  if [ -d "$DIR_BASE16_MAIN" ]; then
    ctp-colorizer "> The directory '$DIR_BASE16_MAIN/' already exists. No need to continue the installation" $CLR_DORANGE "y"
    exit 0
  else
    ctp-colorizer "> Creating '$DIR_BASE16_MAIN/'" $CLR_DPURPLE "y"
    mkdir -p "$DIR_BASE16_MAIN" 
  fi
}


########################################################################################################################
# Multi | Settings | Base16: Clone repository
function __m_settings-base16_clonerepo()
{
  git clone https://github.com/chriskempson/base16-shell.git "$DIR_BASE16_MAIN"
}


########################################################################################################################
# Multi | Settings | Base16: Set Base16
function m_settings-base16_set()
{
  # Check ~/.config/base16-shell
  ctp-colorizer "[1/${STP_M_SET_BASE16}] Checking if the directory '$DIR_BASE16_MAIN/' exists..." $CLR_LBLUE "y"
  __m_settings-base16_checkdir
  ctp-colorizer "[1/${STP_M_SET_BASE16}] Checking if the directory '$DIR_BASE16_MAIN/' exists..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # Clone repository
  ctp-colorizer "[2/${STP_M_SET_BASE16}] Cloning repository from GitHub..." $CLR_LBLUE "y"
  __m_settings-base16_clonerepo
  # Checking repository cloning status
  clonerepo_status=$?
  ctp-colorizer "[2/${STP_M_SET_BASE16}] Cloning repository from GitHub..." $CLR_LBLUE "n"
  # Printing repository cloning status
  if [ $clonerepo_status = 0 ]; then
    ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  else
    ctp-colorizer " [FAIL]" $CLR_LRED "y"
  fi
}
