#!/bin/bash
#
#        Filename: xmd-l_f-pntr.sh
#     Description: Functions to print messages with colors
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-23 11:33:24
#        Modified: 2015-12-30 19:24:31
#
########################################################################################################################
# Print a message by choosing the color to use and the string to print
#   $1: the foreground color to use
#   $2: the text to print
function xmdl_pntr-txt()
{
  echo -n "^fg($1)$2^fg()"
}


########################################################################################################################
# Print a simple error message
function xmdl_pntr-err()
{
  xmdl_pntr-txt $COLOR_LRED "ERROR!"
}
