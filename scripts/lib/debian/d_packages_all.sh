#!/bin/bash

########################################################################################################################
# Debian | Packages | Install all Packages
function d_packages-all_install()
{
  ctp-colorizer "[1/$STP_D_PKG_ALL] Installing all Debian Packages..." $CLR_LCYAN "y"
  # Assigning list of packages
  pldev=$(__d_packages-dev_list)
  plgui=$(__d_packages-gui_list)
  plmed=$(__d_packages-media_list)
  plnet=$(__d_packages-net_list)
  pluti=$(__d_packages-utils_list)
  # Adding a space at the end of the list
  pldev+=" "
  plgui+=" "
  plmed+=" "
  plnet+=" "
  pluti+=" "
  # Concatenating the lists
  plall=$pldev$plgui$plmed$plnet$pluti
  # Installing the lists
  __ctp-pkgs_d-manager $plall
  # Checking installation status
  inst_status=$?
  ctp-colorizer "[1/$STP_D_PKG_ALL] Installing all Debian Packages..." $CLR_LCYAN "n"
  # Printing installation status
  if [ $inst_status = 0 ]; then
    ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  else
    ctp-colorizer " [FAIL]" $CLR_LRED "y"
  fi
}
