#!/bin/bash
#
#        Filename: ctp-args.sh
#     Description: 
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-05 15:03:13
#        Modified: 2015-12-08 15:57:37
#
########################################################################################################################
# Packages | Debian | Manager
#   $1: list of Debian packages to use
function __ctp-pkgs_d-manager()
{
  aptitude install $1
}

# Packages | Debian | Abort
function __ctp-pkgs_d-abort()
{
  ctp-colorizer "Error: The installation has been aborted" $CLR_LRED "y"
}

# Packages | Debian | Main function for installing Debian packages
#   $1: steps
#   $2: category for packages
#   $3: function to create list of packages
function ctp-pkgs_d-install()
{
  ctp-colorizer "[1/$2] Installing Debian $1 Packages..." $CLR_LBLUE "y"
  # Creating and assigning list of packages
  dpl=$($3)
  # Checking list creation status
  dpl_status=$?
  # Printing list creation status
  if [ $dpl_status = 0 ]; then
    # Installing list of packages
    __ctp-pkgs_d-manager $dpl
    # Checking installation status
    inst_status=$?
    ctp-colorizer "[1/$2] Installing Debian $1 Packages..." $CLR_LBLUE "n"
    # Printing installation status
    if [ $inst_status = 0 ]; then
      ctp-colorizer " [DONE]" $CLR_LGREEN "y"
    else
      ctp-colorizer " [FAIL]" $CLR_LRED "y"
    fi
  else
    __ctp-pkgs_d-abort
  fi
}
