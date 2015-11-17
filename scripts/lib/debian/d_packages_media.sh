#!/bin/bash

########################################################################################################################
# Debian | Packages | Install main Packages for Media (music/video)
#    alsa-utils: various ALSA command line tools
#    alsa-oss: OSS compatibility layer
#    mpd: music player daemon
#    mpc: music player client
#    mpv: video player
#    ncmpcpp: ncurses based mpd client
#    vlc: media player
function __d_packages_media_main()
{
  aptitude install \
    alsa-utils \
    alsa-oss \
    mpd \
    mpc \
    mpv \
    ncmpcpp \
    vlc
}


########################################################################################################################
# Debian | Packages | Install Packages for Media (music/video)
function d_packages_media()
{
  # Media | Main packages
  colorize "[1/${STP_D_PKG_MEDIA}] Installing Debian Media Packages (Main)..." $CLR_LBLUE "y"
  __d_packages_media_main
  colorize "[1/${STP_D_PKG_MEDIA}] Installing Debian Media Packages (Main)..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
}
