#!/bin/bash
#
#        Filename: ctp-f_dots.sh
#     Description: ConfigThePenguin | Functions for dotfiles
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-05 15:03:13
#        Modified: 2016-02-10 21:32:32
#
########################################################################################################################
# Multi | Dotfiles | Check if a directory exists
#   $1: file to check
function __ctp-dots_checkd()
{
  if [ -d "$1" ]; then
    ctp-colorizer "> The directory '$1/' already exists." $CLR_DORANGE "y"
    return 1
  else
    ctp-colorizer "> Linking '$1/'" $CLR_DPURPLE "y"
    return 0
  fi
}

# Multi | Dotfiles | Check if a file exists
#   $1: file to check
function __ctp-dots_checkf()
{
  if [ -f "$1" ]; then
    ctp-colorizer "> The file '$1' already exists." $CLR_DORANGE "y"
    return 1
  else
    ctp-colorizer "> Linking '$1'" $CLR_DPURPLE "y"
    return 0
  fi
}

# Multi | Dotfiles | Check exit status
#   $1: step number
#   $2: message to print
function __ctp-dots_checkxst()
{
  # Checking exit status
  exit_status=$?
  ctp-colorizer "[$1/${STP_M_DOT}] $2" $CLR_LBLUE "n"
  # Printing exit status
  if [ $exit_status = 0 ]; then
    ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  else
    ctp-colorizer " [FAIL]" $CLR_LRED "y"
  fi
}


########################################################################################################################
# Multi | Dotfiles | Create a step
#   $1: step number
#   $2: message to print
#   $3: function that will link
function __ctp-dots_step()
{
  ctp-colorizer "[$1/${STP_M_DOT}] $2..." $CLR_LBLUE "y"
  $3
  __ctp-dots_checkxst "$1" "$2..."
}


########################################################################################################################
# Multi | Dotfiles | Create a symbolic link
#   $1: source
#   $2: destination
function __ctp-dots_symlnk()
{
  ln -s $1 $2
}
