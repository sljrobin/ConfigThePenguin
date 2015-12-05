#!/bin/bash

########################################################################################################################
# Multi | Settings | rTorrent: Check if the '~/Downloads/' directory exists
function __m_settings-rtorrent_checkdl()
{
  if [ -d "$DIR_RTORRENT_HOMEDL" ]; then
    ctp-colorizer "> [1/${STP_M_SET_RTORRENT_CHECKDL}] Need to remove '$DIR_RTORRENT_HOMEDL/' to complete the installation" $CLR_DRED "y"
    exit 1
  else
    ctp-colorizer "> [1/${STP_M_SET_RTORRENT_CHECKDL}] Linking '$DIR_RTORRENT_HOMEDL/' to '$DIR_RTORRENT_DOWNLOADS/'" $CLR_DPURPLE "y"
    ln -s $DIR_RTORRENT_DOWNLOADS $DIR_RTORRENT_HOMEDL
  fi
}


########################################################################################################################
# Multi | Settings | rTorrent: Check if the '.rtorrent.rc' file exists
function __m_settings-rtorrent_checkrc()
{
  if [ ! -f "$DIR_RTORRENTRC" ]; then
    ctp-colorizer "> The file '$DIR_RTORRENTRC' does not exist. Need to create a symlink for '$DIR_RTORRENTRC' or copy it." $CLR_DORANGE "y"
  fi
}


########################################################################################################################
# Multi | Settings | rTorrent: Create rTorrent directories
function __m_settings-rtorrent_createdirs()
{
  # Main directory
  if [ -d "$DIR_RTORRENT_MAIN" ]; then
    ctp-colorizer "> [1/${STP_M_SET_RTORRENT_CREATEDIRS}] The directory '$DIR_RTORRENT_MAIN/' already exists." $CLR_DORANGE "y"
  else
    ctp-colorizer "> [1/${STP_M_SET_RTORRENT_CREATEDIRS}] Creating '$DIR_RTORRENT_MAIN/'" $CLR_DPURPLE "y"
    mkdir "$DIR_RTORRENT_MAIN" 
  fi
  # Downloads directory
  if [ -d "$DIR_RTORRENT_DOWNLOADS" ]; then
    ctp-colorizer "> [2/${STP_M_SET_RTORRENT_CREATEDIRS}] The directory '$DIR_RTORRENT_DOWNLOADS/' already exists." $CLR_DORANGE "y"
  else
    ctp-colorizer "> [2/${STP_M_SET_RTORRENT_CREATEDIRS}] Creating '$DIR_RTORRENT_DOWNLOADS/'" $CLR_DPURPLE "y"
    mkdir "$DIR_RTORRENT_DOWNLOADS" 
  fi
  # Session directory
  if [ -d "$DIR_RTORRENT_SESSION" ]; then
    ctp-colorizer "> [3/${STP_M_SET_RTORRENT_CREATEDIRS}] The directory '$DIR_RTORRENT_SESSION/' already exists." $CLR_DORANGE "y"
  else
    ctp-colorizer "> [3/${STP_M_SET_RTORRENT_CREATEDIRS}] Creating '$DIR_RTORRENT_SESSION/'" $CLR_DPURPLE "y"
    mkdir "$DIR_RTORRENT_SESSION" 
  fi
  # Torrents directory
  if [ -d "$DIR_RTORRENT_TORRENTS" ]; then
    ctp-colorizer "> [4/${STP_M_SET_RTORRENT_CREATEDIRS}] The directory '$DIR_RTORRENT_TORRENTS/' already exists." $CLR_DORANGE "y"
  else
    ctp-colorizer "> [4/${STP_M_SET_RTORRENT_CREATEDIRS}] Creating '$DIR_RTORRENT_TORRENTS/'" $CLR_DPURPLE "y"
    mkdir "$DIR_RTORRENT_TORRENTS" 
  fi
}


########################################################################################################################
# Multi | Settings | rTorrent: Set rTorrent
function m_settings-rtorrent_set()
{
  # Check rtorrent.rc
  ctp-colorizer "[1/${STP_M_SET_RTORRENT}] Checking if the file '$DIR_RTORRENTRC' exists..." $CLR_LBLUE "y"
  __m_settings-rtorrent_checkrc
  ctp-colorizer "[1/${STP_M_SET_RTORRENT}] Checking if the file '$DIR_RTORRENTRC' exists..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # Create directories
  ctp-colorizer "[2/${STP_M_SET_RTORRENT}] Creating directories..." $CLR_LBLUE "y"
  __m_settings-rtorrent_createdirs
  ctp-colorizer "[2/${STP_M_SET_RTORRENT}] Creating directories..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # Check Downloads
  ctp-colorizer "[3/${STP_M_SET_RTORRENT}] Checking if the directory '$DIR_RTORRENT_HOMEDL/' exists..." $CLR_LBLUE "y"
  __m_settings-rtorrent_checkdl
  ctp-colorizer "[3/${STP_M_SET_RTORRENT}] Checking if the directory '$DIR_RTORRENT_HOMEDL/' exists..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
}
