#!/bin/bash

########################################################################################################################
function xmonad_copydir()
{
  DIRXMONAD_REPO="../dotfiles/.xmonad/"     # xmonad directory on the repo

  colorize "Copying directory to '$HOME'..." $CLR_LPURPLE "y"
  cp -r "$DIRXMONAD_REPO" "$HOME"
  colorize "Copying directory to '$HOME'... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Check if the directory already exists, if not, copy the directory to $HOME
function xmonad_install()
{
  DIRXMONAD_OS="$HOME/.xmonad/"     # xmonad directory on the OS
 
  colorize "Checking if the xmonad's directory already exists..." $CLR_LPURPLE "y"
  if [ -d "$DIRXMONAD_OS" ]; then
    colorize "The directory already exists. No need to install xmonad again or remove '$DIRXMONAD_OS' for a fresh install." $CLR_LRED "y"
    colorize "Checking if the xmonad's directory already exists... [DONE]" $CLR_LGREEN "y"
  else
    colorize "Checking if the xmonad's directory already exists... [DONE]" $CLR_LGREEN "y"
    xmonad_copydir
  fi
}
