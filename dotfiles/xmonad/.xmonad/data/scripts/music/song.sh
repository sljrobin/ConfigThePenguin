#!/bin/bash

source $HOME/.xmonad/data/scripts/_core.sh

## VARIABLES
MPC_STATUS=$(mpc | sed -n '2p' | cut -d' ' -f1 | tr -d '[' | tr -d ']')
MPC_STATUS_PAUSED="paused"
MPC_STATUS_PLAYING="playing"
MPD_STATUS=$(mpc | grep "mpd error: Connection refused")


## FUNCTIONS
# Check if MPD is on
#function is_mpd()
#{
#}


# Handle the MPC status
function handle_mpcstatus()
{
  # MPD OFF
  if [ -z "$MPD_STATUS" ]; then
    color_fg $COLOR_LRED "O"
  # Playing
  if [ "$MPC_STATUS" == "$MPC_STATUS_PLAYING" ]; then
    SONG_NAME=$(mpc | sed -n '1p')
    SONG_NUMBER=$(mpc | sed -n '2p' | cut -d' ' -f2 | tr -d '#')
    SONG_TIME=$(mpc | sed -n '2p' | cut -d' ' -f5)
    SONG_TIME_PERCENTAGE=$(mpc | sed -n '2p' | cut -d' ' -f6 | tr -d '(' | tr -d ')')
    color_fg $COLOR_LBLUE "$SONG_NUMBER "
    color_fg $COLOR_LORANGE "$SONG_TIME_PERCENTAGE "
    color_fg $COLOR_LGREEN "$SONG_TIME "
    color_fg $COLOR_LMAGENTA "$SONG_NAME"
  # Paused
  elif [ "$MPC_STATUS" == "$MPC_STATUS_PAUSED" ]; then
    SONG_NAME=$(mpc | sed -n '1p')
    SONG_NUMBER=$(mpc | sed -n '2p' | cut -d' ' -f3 | tr -d '#')
    SONG_TIME=$(mpc | sed -n '2p' | cut -d' ' -f6)
    SONG_TIME_PERCENTAGE=$(mpc | sed -n '2p' | cut -d' ' -f7 | tr -d '(' | tr -d ')')
    color_fg $COLOR_DBLUE "$SONG_NUMBER "
    color_fg $COLOR_DORANGE "$SONG_TIME_PERCENTAGE "
    color_fg $COLOR_DGREEN "$SONG_TIME "
    color_fg $COLOR_DMAGENTA "$SONG_NAME"
  # Stopped
  else
    echo -n ""
  fi
  fi
}


# Main function
function main()
{
  #is_mpd
  handle_mpcstatus
}


## MAIN
main
