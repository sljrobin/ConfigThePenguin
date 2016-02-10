#!/bin/bash
#
#        Filename: d_packages_all.sh
#     Description: ConfigThePenguin | Debian - Packages - All
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-02-10 21:12:26
#        Modified: 2016-02-10 21:50:27
#
########################################################################################################################
# Debian | Packages | Install all Packages
function d_packages-all_install()
{
  ctp-colorizer "[1/$STP_D_PKG_ALL] Installing all Debian Packages..." $CLR_LCYAN "y"
  # Installing all the packages
  $(d_packages-dev_install)
  $(d_packages-gui_install)
  $(d_packages-media_install)
  $(d_packages-net_install)
  $(d_packages-utils_install)
  # Checking installation status
  inst_status=$?
  ctp-colorizer "[2/$STP_D_PKG_ALL] Installing all Debian Packages..." $CLR_LCYAN "n"
  # Printing installation status
  if [ $inst_status = 0 ]; then
    ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  else
    ctp-colorizer " [FAIL]" $CLR_LRED "y"
  fi
}
