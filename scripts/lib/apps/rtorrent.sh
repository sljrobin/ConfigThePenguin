#!/bin/bash

########################################################################################################################
# Check if the '~/Downloads/' directory exists
function rtorrent_checkdl()
{
  colorize "Checking if the directory '$DIR_RTORRENT_HOMEDL/' exists..." $CLR_LPURPLE "y"
  if [ -d "$DIR_RTORRENT_HOMEDL" ]; then
    colorize "Need to remove '$DIR_RTORRENT_HOMEDL/' to finish the installation." $CLR_LRED "y"
    colorize "Checking if the directory '$DIR_RTORRENT_HOMEDL/' exists... [DONE]" $CLR_LGREEN "y"
    exit 1
  else
    colorize "Linking '$DIR_RTORRENT_HOMEDL/' to '$DIR_RTORRENT_DOWNLOADS/'" $CLR_LBLUE "y"
    ln -s $DIR_RTORRENT_DOWNLOADS $DIR_RTORRENT_HOMEDL
    colorize "Checking if the directory '$DIR_RTORRENT_HOMEDL/' exists... [DONE]" $CLR_LGREEN "y"
  fi
}


########################################################################################################################
# Check if the '.rtorrent.rc' exists
function rtorrent_checkrc()
{
  colorize "Checking if '$DIR_RTORRENTRC' exists..." $CLR_LPURPLE "y"
  if [ ! -f "$DIR_RTORRENTRC" ]; then
    colorize "The file '$DIR_RTORRENTRC' does not exist. Need to create a symlink for '$DIR_RTORRENTRC'." $CLR_LORANGE "y"
  fi
  colorize "Checking if '$DIR_RTORRENTRC' exists... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Create the rtorrent directories
function rtorrent_install()
{
  rtorrent_checkrc
  colorize "Installing rTorrent and making all the directories..." $CLR_LPURPLE "y"
  colorize "Installing rTorrent [1/${STP_RTORRENT_INSTALL}] Making main directory '$DIR_RTORRENT_MAIN/'" $CLR_LBLUE "y"
  if [ -d "$DIR_RTORRENT_MAIN" ]; then
    colorize "The directory '$DIR_RTORRENT_MAIN/' already exists." $CLR_LRED "y"
  else
    mkdir "$DIR_RTORRENT_MAIN" 
  fi
  colorize "Installing rTorrent [2/${STP_RTORRENT_INSTALL}] Making downloads directory '$DIR_RTORRENT_DOWNLOADS/'" $CLR_LBLUE "y"
  if [ -d "$DIR_RTORRENT_DOWNLOADS" ]; then
    colorize "The directory '$DIR_RTORRENT_DOWNLOADS/' already exists." $CLR_LRED "y"
  else
    mkdir "$DIR_RTORRENT_DOWNLOADS" 
  fi
  colorize "Installing rTorrent [3/${STP_RTORRENT_INSTALL}] Making session directory '$DIR_RTORRENT_SESSION/'" $CLR_LBLUE "y"
  if [ -d "$DIR_RTORRENT_SESSION" ]; then
    colorize "The directory '$DIR_RTORRENT_SESSION/' already exists." $CLR_LRED "y"
  else
    mkdir "$DIR_RTORRENT_SESSION" 
  fi
  colorize "Installing rTorrent [4/${STP_RTORRENT_INSTALL}] Making torrents directory '$DIR_RTORRENT_TORRENTS/'" $CLR_LBLUE "y"
  if [ -d "$DIR_RTORRENT_TORRENTS" ]; then
    colorize "The directory '$DIR_RTORRENT_TORRENTS/' already exists." $CLR_LRED "y"
  else
    mkdir "$DIR_RTORRENT_TORRENTS" 
  fi
  rtorrent_checkdl
  colorize "Installing rTorrent and making all the directories... [DONE]" $CLR_LGREEN "y"
}
