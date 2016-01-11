#!/bin/bash
#
#        Filename: os.sh
#     Description: Tool for OS
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-30 19:25:57
#        Modified: 2015-12-31 19:39:02
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# OS | Get information
#   $1: OS to select
function __xmdt_os-getinfo()
{
  uname -a | grep $1
}


################################################################################
# OS | Get number of updates for Arch
function __xmdt_os-getupdta()
{
  local updt_arch=$(pacman -Qu | wc -l)  # Get number of updates for Arch

  if [ $updt_arch != "0" ]; then
    xmdl_pntr-txt $color_lorange $updt_arch
  fi
}


################################################################################
# OS | Get number of updates for Debian
function __xmdt_os-getupdtd()
{
  local updt_debian=$(apt-get upgrade -s | grep -P '^\d+ upgraded' | cut -d" " -f1)  # Get number of updates for Debian

  if [ $updt_debian != "0" ]; then
    xmdl_pntr-txt $color_lorange $updt_debian
  fi
}


################################################################################
# OS | Find the current OS
function __xmdt_os-find()
{
  local linux_arch="ARCH"                                  # Linux: Arch
  local linux_debian="Debian"                              # Linux: Debian
  local os_info_arch=$(__xmdt_os-getinfo $linux_arch)      # OS Info: Arch
  local os_info_debian=$(__xmdt_os-getinfo $linux_debian)  # OS Info: Debian
  local updt_arch=$(__xmdt_os-getupdta)                    # Updates: Arch
  local updt_debian=$(__xmdt_os-getupdtd)                  # Updates: Debian

  # Arch
  if [ -n "$os_info_arch" ]; then
    xmdl_pntr-txt $COLOR_LBLUE "A"
    echo -n " "
    __xmdt_os-getupdta
  # Debian
  elif [ -n "$os_info_debian" ]; then
    xmdl_pntr-txt $COLOR_LMAGENTA "D"
    echo -n " "
    __xmdt_os-getupdtd
  # Unknown OS
  else
    xmdl_pntr-txt $COLOR_LRED "U"
    echo -n " "
  fi
}


################################################################################
# OS | Main
function xmdt_os()
{
  __xmdt_os-find
}


########################################################################################################################
xmdt_os
