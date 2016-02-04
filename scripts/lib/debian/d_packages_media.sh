#!/bin/bash

########################################################################################################################
# Debian | Packages | List Packages for Media (music/video)
#    alsa-utils: various ALSA command line tools
#    alsa-oss: OSS compatibility layer
#    id3v2: ID3 tag editor
#    mpd: music player daemon
#    mpc: music player client
#    mpv: video player
#    ncmpcpp: ncurses based mpd client
#    vlc: media player
function __d_packages-media_list()
{
  # List
  plmedia=$(whiptail --title "Debian | Packages | Media" --checklist \
    "\nSelect Debian Packages to install for Media" 15 57 7 \
    "alsa-utils" "Various ALSA command line tools" ON \
    "alsa-oss" "OSS compatibility layer" ON \
    "id3v2" "ID3 tag editor" ON \
    "mpd" "Music Player Daemon" ON \
    "mpc" "Music Player Client" ON \
    "mpv" "Video player" ON \
    "ncmpcpp" "ncurses based mpd client" ON \
    "vlc" "Media player" ON 3>&1 1>&2 2>&3)
  # Exit status
  pl_status=$?
  # 'OK' option selected
  if [ $pl_status = 0 ]; then
    # Clean the package list
    pl_cleaned=$(ctp-parser_rmdquotes "$plmedia")
    echo $pl_cleaned
  # 'Cancel' option selected
  else
    __ctp-pkgs_d-abort
    exit 1
  fi
}


########################################################################################################################
# Debian | Packages | Install Packages for Media (music/video)
function d_packages-media_install()
{
  ctp-pkgs_d-install "Media" $STP_D_PKG_MEDIA __d_packages-media_list 
}
