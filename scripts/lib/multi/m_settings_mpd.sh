#!/bin/bash

########################################################################################################################
# Multi | Settings | MPD: Check if the 'mpd.conf' file exists
function __m_settings-mpd_checkconf()
{
  if [ ! -f "$DIR_MPDCONF" ]; then
    ctp-colorizer "> The file '$DIR_MPDCONF' does not exist. Need to create a symlink for '$DIR_MPDCONF' or copy it." $CLR_DRED "y"
    exit 1
  fi
}


########################################################################################################################
# Multi | Settings | MPD: Create MPD directories
function __m_settings-mpd_createdirs()
{
  # Playlists directory
  if [ -d "$DIR_MPD_PLAYLISTS" ]; then
    ctp-colorizer "> [1/${STP_M_SET_MPD_CREATEDIRS}] The directory '$DIR_MPD_PLAYLISTS/' already exists." $CLR_DORANGE "y"
  else
    ctp-colorizer "> [1/${STP_M_SET_MPD_CREATEDIRS}] Creating '$DIR_MPD_PLAYLISTS/'" $CLR_DPURPLE "y"
    mkdir -p "$DIR_MPD_PLAYLISTS" 
  fi
}


########################################################################################################################
# Multi | Settings | MPD: Create MPD files
function __m_settings-mpd_createfiles()
{
  # Database file
  if [ -f "$DIR_MPD_DB" ]; then
    ctp-colorizer "> [1/${STP_M_SET_MPD_CREATEFILES}] The file '$DIR_MPD_DB' already exists." $CLR_DORANGE "y"
  else
    ctp-colorizer "> [1/${STP_M_SET_MPD_CREATEFILES}] Creating '$DIR_MPD_DB'" $CLR_DPURPLE "y"
    touch "$DIR_MPD_DB"
  fi
  # Log file
  if [ -f "$DIR_MPD_LOG" ]; then
    ctp-colorizer "> [2/${STP_M_SET_MPD_CREATEFILES}] The file '$DIR_MPD_LOG' already exists." $CLR_DORANGE "y"
  else
    ctp-colorizer "> [2/${STP_M_SET_MPD_CREATEFILES}] Creating '$DIR_MPD_LOG'" $CLR_DPURPLE "y"
    touch "$DIR_MPD_LOG"
  fi
  # PID file
  if [ -f "$DIR_MPD_PID" ]; then
    ctp-colorizer "> [3/${STP_M_SET_MPD_CREATEFILES}] The file '$DIR_MPD_PID' already exists." $CLR_DORANGE "y"
  else
    ctp-colorizer "> [3/${STP_M_SET_MPD_CREATEFILES}] Creating '$DIR_MPD_PID'" $CLR_DPURPLE "y"
    touch "$DIR_MPD_PID"
  fi
  # State file
  if [ -f "$DIR_MPD_STATE" ]; then
    ctp-colorizer "> [4/${STP_M_SET_MPD_CREATEFILES}] The file '$DIR_MPD_STATE' already exists." $CLR_DORANGE "y"
  else
    ctp-colorizer "> [4/${STP_M_SET_MPD_CREATEFILES}] Creating '$DIR_MPD_STATE'" $CLR_DPURPLE "y"
    touch "$DIR_MPD_STATE"
  fi
}


########################################################################################################################
# Multi | Settings | MPD: Set MPD
function m_settings-mpd_set()
{
  # Check mpd.conf
  ctp-colorizer "[1/${STP_M_SET_MPD}] Checking if the file '$DIR_MPDCONF' exists..." $CLR_LBLUE "y"
  __m_settings-mpd_checkconf
  ctp-colorizer "[1/${STP_M_SET_MPD}] Checking if the file '$DIR_MPDCONF' exists..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # Create files
  ctp-colorizer "[2/${STP_M_SET_MPD}] Creating files..." $CLR_LBLUE "y"
  __m_settings-mpd_createfiles
  ctp-colorizer "[2/${STP_M_SET_MPD}] Creating files..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # Create directories
  ctp-colorizer "[3/${STP_M_SET_MPD}] Creating directories..." $CLR_LBLUE "y"
  __m_settings-mpd_createdirs
  ctp-colorizer "[3/${STP_M_SET_MPD}] Creating directories..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
}
