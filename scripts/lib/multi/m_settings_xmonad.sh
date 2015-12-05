#!/bin/bash

########################################################################################################################
# Multi | Settings | xmonad: Check if the main file '~/.xmonad.hs' exists
function __m_settings-xmonad_checkhs()
{
  if [ ! -f "$DIR_XMONADHS" ]; then
    ctp-colorizer "> The file '$DIR_XMONADHS' does not exist. Need to create or copy '$DIR_XMONADHS' to complete the installation" $CLR_DRED "y"
    exit 1
  fi
}


########################################################################################################################
# Multi | Settings | xmonad: Compile xmonad
function __m_settings-xmonad_compile()
{
  xmonad --recompile
}

########################################################################################################################
# Multi | Settings | xmonad: Set xmonad
function m_settings-xmonad_set()
{
  # Check for the main file
  ctp-colorizer "[1/${STP_M_SET_XMONAD}] Checking if the file '$DIR_XMONADHS' exists..." $CLR_LBLUE "y"
  __m_settings-xmonad_checkhs
  ctp-colorizer "[1/${STP_M_SET_XMONAD}] Checking if the file '$DIR_XMONADHS' exists..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # Compile xmonad
  ctp-colorizer "[2/${STP_M_SET_XMONAD}] Compiling xmonad..." $CLR_LBLUE "y"
  __m_settings-xmonad_compile
  ctp-colorizer "[2/${STP_M_SET_XMONAD}] Compiling xmonad..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
}
