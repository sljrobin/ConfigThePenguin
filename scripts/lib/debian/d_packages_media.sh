#!/bin/bash
#
#        Filename: d_packages_media.sh
#     Description: ConfigThePenguin | Debian - Packages - Media
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-02-10 21:21:54
#        Modified: 2016-02-10 21:41:21
#
########################################################################################################################
# Debian | Packages | Install Packages for Media (music/video)
#    alsa-utils: various ALSA command line tools
#    alsa-oss: OSS compatibility layer
#    id3v2: ID3 tag editor
#    mpd: music player daemon
#    mpc: music player client
#    mpv: video player
#    ncmpcpp: ncurses based mpd client
#    vlc: media player
function d_packages-media_install()
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
    ctp-pkgs_d-install "Media" $STP_D_PKG_MEDIA "$plmedia"
  # 'Cancel' option selected
  else
    __ctp-pkgs_d-abort
    exit 1
  fi
}
