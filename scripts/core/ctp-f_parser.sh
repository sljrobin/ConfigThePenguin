#!/bin/bash
#
#        Filename: ctp_args.sh
#     Description: 
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-05 15:03:13
#        Modified: 2015-12-05 16:21:47
#
########################################################################################################################
# Parser | Remove double quotes
#   $1: package list to use
function ctp-parser_rmdquotes()
{
  local str=$(echo "$1" | tr -d "\"")
  echo $str
}
