#!/bin/bash
#
#        Filename: song.sh
#     Description: Tool for song
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-02-07 00:44:21
#        Modified: 2016-02-07 02:46:03
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Song | Get the album of the current song when MPC is paused
function __xmdt_song-getcsalbpa()
{
  local album=$(mpc --format "%album%" | sed -n '1p')  # Get album

  echo $album
}


################################################################################
# Song | Get the artist of the current song when MPC is paused
function __xmdt_song-getcsartpa()
{
  local artist=$(mpc --format "%artist%" | sed -n '1p')  # Get artist

  echo $artist
}


################################################################################
# Song | Get the track number of the current song when MPC is paused
function __xmdt_song-getcsnumpa()
{
  local number=$(mpc | sed -n '2p' | cut -d' ' -f3 | tr -d '#')  # Get number

  echo $number
}


################################################################################
# Song | Get the percentage of the current song when MPC is paused
function __xmdt_song-getcsperpa()
{
  local percentage=$(mpc | sed -n '2p' | cut -d' ' -f7 | tr -d '(' | tr -d ')')  # Get percentage

  echo $percentage
}


################################################################################
# Song | Get the time of the current song when MPC is paused
function __xmdt_song-getcstimpa()
{
  local time=$(mpc | sed -n '2p' | cut -d' ' -f6)  # Get time

  echo $time
}


################################################################################
# Song | Get the title of the current song when MPC is paused
function __xmdt_song-getcstitpa()
{
  local title=$(mpc --format "%title%" | sed -n '1p')  # Get title

  echo $title
}


################################################################################
# Song | Get the album of the current song when MPC is playing
function __xmdt_song-getcsalbpl()
{
  local album=$(mpc --format "%album%" | sed -n '1p')  # Get album

  echo $album
}


################################################################################
# Song | Get the artist of the current song when MPC is playing
function __xmdt_song-getcsartpl()
{
  local artist=$(mpc --format "%artist%" | sed -n '1p')  # Get artist

  echo $artist
}


################################################################################
# Song | Get the track number of the current song when MPC is playing
function __xmdt_song-getcsnumpl()
{
  local number=$(mpc | sed -n '2p' | cut -d' ' -f2 | tr -d '#')  # Get number

  echo $number
}


################################################################################
# Song | Get the percentage of the current song when MPC is playing
function __xmdt_song-getcsperpl()
{
  local percentage=$(mpc | sed -n '2p' | cut -d' ' -f6 | tr -d '(' | tr -d ')')  # Get percentage

  echo $percentage
}


################################################################################
# Song | Get the time of the current song when MPC is playing
function __xmdt_song-getcstimpl()
{
  local time=$(mpc | sed -n '2p' | cut -d' ' -f5)  # Get time

  echo $time
}


################################################################################
# Song | Get the title of the current song when MPC is playing
function __xmdt_song-getcstitpl()
{
  local title=$(mpc --format "%title%" | sed -n '1p')  # Get title

  echo $title
}


################################################################################
# Song | Get the status of MPC
function __xmdt_song-getmpcst()
{
  local mpc_status=$(mpc | sed -n '2p' | cut -d' ' -f1 | tr -d '[' | tr -d ']')  # Get MPC status

  echo $mpc_status
}


################################################################################
# Song | Show current details song when MPC is paused
function __xmdt_song-showcsdtpa()
{
  local songalb=$(__xmdt_song-getcsalbpa)  # Song's album
  local songart=$(__xmdt_song-getcsartpa)  # Song's artist
  local songnum=$(__xmdt_song-getcsnumpa)  # Song's track number
  local songper=$(__xmdt_song-getcsperpa)  # Song's percentage
  local songtim=$(__xmdt_song-getcstimpa)  # Song's time
  local songtit=$(__xmdt_song-getcstitpa)  # Song's title

  xmdl_pntr-txt $COLOR_LGREY "["
  xmdl_pntr-txt $COLOR_LGREY "$songnum"
  xmdl_pntr-txt $COLOR_LGREY "]["
  xmdl_pntr-txt $COLOR_LGREY "$songtim $songper"
  xmdl_pntr-txt $COLOR_LGREY "]["
  xmdl_pntr-txt $COLOR_LGREY "$songtit"
  xmdl_pntr-txt $COLOR_LGREY "]["
  xmdl_pntr-txt $COLOR_LGREY "$songart"
  xmdl_pntr-txt $COLOR_LGREY "]["
  xmdl_pntr-txt $COLOR_LGREY "$songalb"
  xmdl_pntr-txt $COLOR_LGREY "]"
}


################################################################################
# Song | Show current details song when MPC is playing
function __xmdt_song-showcsdtpl()
{
  local songalb=$(__xmdt_song-getcsalbpl)  # Song's album
  local songart=$(__xmdt_song-getcsartpl)  # Song's artist
  local songnum=$(__xmdt_song-getcsnumpl)  # Song's track number
  local songper=$(__xmdt_song-getcsperpl)  # Song's percentage
  local songtim=$(__xmdt_song-getcstimpl)  # Song's time
  local songtit=$(__xmdt_song-getcstitpl)  # Song's title

  xmdl_pntr-txt $COLOR_LGREY "["
  xmdl_pntr-txt $COLOR_LGREEN "$songnum"
  xmdl_pntr-txt $COLOR_LGREY "]["
  xmdl_pntr-txt $COLOR_LCYAN "$songtim $songper"
  xmdl_pntr-txt $COLOR_LGREY "]["
  xmdl_pntr-txt $COLOR_LWHITE "$songtit"
  xmdl_pntr-txt $COLOR_LGREY "]["
  xmdl_pntr-txt $COLOR_LRED "$songart"
  xmdl_pntr-txt $COLOR_LGREY "]["
  xmdl_pntr-txt $COLOR_LBLUE "$songalb"
  xmdl_pntr-txt $COLOR_LGREY "]"
}


################################################################################
# Song | Handle the status of MPC
function __xmdt_song-handlempcst()
{
  local mpc_status=$(__xmdt_song-getmpcst)  # Get MPC status
  local mpc_status_paused="paused"          # MPC status: paused
  local mpc_status_playing="playing"        # MPC status: playing

  # MPC: playing
  if [ "$mpc_status" == "$mpc_status_playing" ]; then
    xmdl_icns-show $ICON_MUSIC_PLAY
    __xmdt_song-showcsdtpl
  # MPC: paused
  elif [ "$mpc_status" == "$mpc_status_paused" ]; then
    xmdl_icns-show $ICON_MUSIC_PAUSE
    __xmdt_song-showcsdtpa
  # MPC: stopped
  else
    xmdl_icns-show $ICON_MUSIC_STOP
  fi
}


################################################################################
# Song | Main
function xmdt_song()
{
  __xmdt_song-handlempcst
}


########################################################################################################################
xmdt_song
