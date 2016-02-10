#!/bin/bash
#
#        Filename: ctp-f_pkgs.sh
#     Description: ConfigThePenguin | Functions for packages
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-05 15:03:13
#        Modified: 2016-02-10 21:32:43
#
########################################################################################################################
# Packages | Debian | Abort
function __ctp-pkgs_d-abort()
{
  ctp-colorizer "Error: The installation has been aborted" $CLR_LRED "y"
}

# Packages | Debian | Main function for installing Debian packages
#   $1: category for packages
#   $2: steps
#   $3: list of packages to install
function ctp-pkgs_d-install()
{
  # Clean the package list
  pl_cleaned=$(ctp-parser_rmdquotes "$3")
  # Install part 1
  ctp-colorizer "[1/$2] Installing Debian $1 Packages..." $CLR_LBLUE "y"
  # Installing list of packages
  aptitude install $pl_cleaned
  # Checking installation status
  inst_status=$?
  # Install part 2
  ctp-colorizer "[2/$2] Installing Debian $1 Packages..." $CLR_LBLUE "n"
  # Printing installation status
  if [ $inst_status = 0 ]; then
    ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  else
    ctp-colorizer " [FAIL]" $CLR_LRED "y"
  fi
}
