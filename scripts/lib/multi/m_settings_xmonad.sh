#!/bin/bash

########################################################################################################################
# Copy directory from project's directory to HOME
function xmonad_copydir()
{
  colorize "Copying directory to '$HOME'..." $CLR_LPURPLE "y"
  cp -r "$DIR_XMONAD_REPO" "$HOME"
  colorize "Copying directory to '$HOME'... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Check if the directory already exists, if not, copy the directory to $HOME
function xmonad_install()
{
  colorize "Checking if the xmonad's directory already exists..." $CLR_LPURPLE "y"
  if [ -d "$DIR_XMONAD_OS" ]; then
    colorize "The directory already exists. No need to install xmonad again or remove '$DIR_XMONAD_OS' for a fresh install." $CLR_LRED "y"
    colorize "Checking if the xmonad's directory already exists... [DONE]" $CLR_LGREEN "y"
  else
    colorize "Checking if the xmonad's directory already exists... [DONE]" $CLR_LGREEN "y"
    xmonad_copydir
  fi
}


########################################################################################################################
# Update the project's directory by copying the directory from HOME to the project's directory
function xmonad_update()
{
  colorize "Updating the xmonad directory for GitHub..." $CLR_LPURPLE "y"
  colorize "Updating xmonad [1/${STP_XMD_UPDATE}] Checking if the directory '$DIR_XMONAD_OS' exists" $CLR_LBLUE "y"
  if [ ! -d "$DIR_XMONAD_OS" ]; then
    colorize "The directory does not exist in '$HOME'. Make sure to have the directory '$DIR_XMONAD_OS'." $CLR_LRED "y"
  else
    colorize "Updating xmonad [2/${STP_XMD_UPDATE}] Copying the main file 'xmonad.hs'" $CLR_LBLUE "y"
    cp -r "$DIR_XMONAD_OS/xmonad.hs" "$DIR_XMONAD_REPO"
    colorize "Updating xmonad [3/${STP_XMD_UPDATE}] Copying the directory 'data/'" $CLR_LBLUE "y"
    cp -r "$DIR_XMONAD_OS/data" "$DIR_XMONAD_REPO"
    colorize "Updating xmonad [4/${STP_XMD_UPDATE}] Copying the directory 'lib/'" $CLR_LBLUE "y"
    cp -r "$DIR_XMONAD_OS/lib/" "$DIR_XMONAD_REPO"
    colorize "Updating xmonad [5/${STP_XMD_UPDATE}] Removing the '*.hi' files in the directory 'lib/'" $CLR_LBLUE "y"
    rm "$DIR_XMONAD_REPO/lib"/*.hi
    colorize "Updating xmonad [6/${STP_XMD_UPDATE}] Removing the '*.o' files in the directory 'lib/'" $CLR_LBLUE "y"
    rm "$DIR_XMONAD_REPO/lib/"*.o
    colorize "Updating the xmonad directory for GitHub... [DONE]" $CLR_LGREEN "y"
  fi
}
