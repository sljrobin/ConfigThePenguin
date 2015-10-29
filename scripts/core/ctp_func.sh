#!/bin/bash

########################################################################################################################
# Print an error message when there is an insufficient number of arguments
function args_insufficient()
{
  colorize "Error: Insufficient number of arguments" $CLR_LRED "y"
}


# Print an error message when an invalid argument is entered
#   $1: next argument
function args_invalid()
{
  colorize "Error: '$1' is an invalid argument" $CLR_LRED "y"
}


########################################################################################################################
# Output a text with color
#   $1: text to print
#   $2: color to use
#   $3: add or not a new line
#         "y": add a new line
#         "n": do not add a new line
function colorize()
{
  # Add a new line
  if [ "$3" == "y" ] ; then
    printf "${2}${1}${CLR_RESET}\n"
  # No new line
  elif [ "$3" == "n" ] ; then
    printf "${2}${1}${CLR_RESET}"
  # Error with newline
  else 
    echo "Error with the new line..."
  fi
}


########################################################################################################################
# Firefox: show all the add-ons
function args_apps_firefox_addons()
{
  firefox_addon_show_all
}


# vim: installation of plugins
#   $1: next argument
function args_apps_vim_install()
{
  case $1 in
             base16) vim_install_base16 ;;           # vim install: base16
           commandt) vim_install_commandt ;;         # vim install: Command-T
        delimitmate) vim_install_delimitmate ;;      # vim install: delimitMate
         indentline) vim_install_indentline ;;       # vim install: indentLine
    multiplecursors) vim_install_multiplecursors ;;  # vim install: vim-multiple-cursors 
           nerdtree) vim_install_nerdtree ;;         # vim install: NERD Tree
           pathogen) vim_install_pathogen ;;         # vim install: Pathogen
           surround) vim_install_surround ;;         # vim install: Surround
            taglist) vim_install_taglist ;;          # vim install: Tag List
      youcompleteme) vim_install_youcompleteme ;;    # vim install: YouCompleteMe
                  *) args_invalid $1 ;;              # vim install: Invalid argument
  esac
}


# xmonad: installation
function args_apps_xmonad_install()
{
  xmonad_install
}


########################################################################################################################
# xmonad: update for GitHub
function args_apps_xmonad_update()
{
  xmonad_update
}


########################################################################################################################
# Debian: installation of packages
#   $1: next argument
function args_os_debian_install()
{
  case $1 in
    colorscheme) debian_install_colorscheme ;;  # Debian install: colorscheme
            dev) debian_install_dev ;;          # Debian install: dev
            gui) debian_install_gui ;;          # Debian install: gui
          media) debian_install_media ;;        # Debian install: media
        network) debian_install_network ;;      # Debian install: network
          utils) debian_install_utils ;;        # Debian install: utils
  esac
}
