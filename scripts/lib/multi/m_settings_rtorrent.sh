#!/bin/bash

########################################################################################################################
# Multi | Settings | rTorrent: Check if the '~/Downloads/' directory exists
function __m_settings_rtorrent_checkdl()
{
  if [ -d "$DIR_RTORRENT_HOMEDL" ]; then
    colorize "> [1/${STP_M_SET_RTORRENT_CHECKDL}] Need to remove '$DIR_RTORRENT_HOMEDL/' to complete the installation" $CLR_DRED "y"
    exit 1
  else
    colorize "> [1/${STP_M_SET_RTORRENT_CHECKDL}] Linking '$DIR_RTORRENT_HOMEDL/' to '$DIR_RTORRENT_DOWNLOADS/'" $CLR_DPURPLE "y"
    ln -s $DIR_RTORRENT_DOWNLOADS $DIR_RTORRENT_HOMEDL
  fi
}


########################################################################################################################
# Multi | Settings | rTorrent: Check if the '.rtorrent.rc' file exists
function __m_settings_rtorrent_checkrc()
{
  if [ ! -f "$DIR_RTORRENTRC" ]; then
    colorize "> The file '$DIR_RTORRENTRC' does not exist. Need to create a symlink for '$DIR_RTORRENTRC' or copy it." $CLR_DORANGE "y"
  fi
}


########################################################################################################################
# Multi | Settings | rTorrent: Create rTorrent directories
function __m_settings_rtorrent_createdirs()
{
  # Main directory
  if [ -d "$DIR_RTORRENT_MAIN" ]; then
    colorize "> [1/${STP_M_SET_RTORRENT_CREATEDIRS}] The directory '$DIR_RTORRENT_MAIN/' already exists." $CLR_DORANGE "y"
  else
    colorize "> [1/${STP_M_SET_RTORRENT_CREATEDIRS}] Creating '$DIR_RTORRENT_MAIN/'" $CLR_DPURPLE "y"
    mkdir "$DIR_RTORRENT_MAIN" 
  fi
  # Downloads directory
  if [ -d "$DIR_RTORRENT_DOWNLOADS" ]; then
    colorize "> [2/${STP_M_SET_RTORRENT_CREATEDIRS}] The directory '$DIR_RTORRENT_DOWNLOADS/' already exists." $CLR_DORANGE "y"
  else
    colorize "> [2/${STP_M_SET_RTORRENT_CREATEDIRS}] Creating '$DIR_RTORRENT_DOWNLOADS/'" $CLR_DPURPLE "y"
    mkdir "$DIR_RTORRENT_DOWNLOADS" 
  fi
  # Session directory
  if [ -d "$DIR_RTORRENT_SESSION" ]; then
    colorize "> [3/${STP_M_SET_RTORRENT_CREATEDIRS}] The directory '$DIR_RTORRENT_SESSION/' already exists." $CLR_DORANGE "y"
  else
    colorize "> [3/${STP_M_SET_RTORRENT_CREATEDIRS}] Creating '$DIR_RTORRENT_SESSION/'" $CLR_DPURPLE "y"
    mkdir "$DIR_RTORRENT_SESSION" 
  fi
  # Torrents directory
  if [ -d "$DIR_RTORRENT_TORRENTS" ]; then
    colorize "> [4/${STP_M_SET_RTORRENT_CREATEDIRS}] The directory '$DIR_RTORRENT_TORRENTS/' already exists." $CLR_DORANGE "y"
  else
    colorize "> [4/${STP_M_SET_RTORRENT_CREATEDIRS}] Creating '$DIR_RTORRENT_TORRENTS/'" $CLR_DPURPLE "y"
    mkdir "$DIR_RTORRENT_TORRENTS" 
  fi
}


########################################################################################################################
# Multi | Settings | rTorrent: Install rTorrent
function m_settings_rtorrent()
{
  # Check rtorrent.rc
  colorize "[1/${STP_M_SET_RTORRENT}] Checking if the file '$DIR_RTORRENTRC' exists..." $CLR_LBLUE "y"
  __m_settings_rtorrent_checkrc
  colorize "[1/${STP_M_SET_RTORRENT}] Checking if the file '$DIR_RTORRENTRC' exists..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
  # Create directories
  colorize "[2/${STP_M_SET_RTORRENT}] Creating directories..." $CLR_LBLUE "y"
  __m_settings_rtorrent_createdirs
  colorize "[2/${STP_M_SET_RTORRENT}] Creating directories..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
  # Check Downloads
  colorize "[3/${STP_M_SET_RTORRENT}] Checking if the directory '$DIR_RTORRENT_HOMEDL/' exists..." $CLR_LBLUE "y"
  __m_settings_rtorrent_checkdl
  colorize "[3/${STP_M_SET_RTORRENT}] Checking if the directory '$DIR_RTORRENT_HOMEDL/' exists..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
}
