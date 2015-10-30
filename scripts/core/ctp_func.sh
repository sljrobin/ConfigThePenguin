#!/bin/bash

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


# xmonad: update for GitHub
function args_apps_xmonad_update()
{
  xmonad_update
}


########################################################################################################################
# Help: print details for the first arguments
#   $1: short argument
#   $2: long argument
function args_lvl1()
{
  colorize "$1" $CLR_LORANGE "n"
  echo -n " | "
  colorize "$2" $CLR_LORANGE "y"
}


# Help: print details for the second arguments
#   $1: argument
function args_lvl2()
{
  echo -n "    "
  colorize "$1" $CLR_LBLUE "y"
}


# Help: print details for the third arguments
#   $1: short argument
#   $2: long argument
function args_lvl3()
{
  echo -n "        "
  colorize "$1" $CLR_LGREEN "n"
  echo -n " | "
  colorize "$2" $CLR_LGREEN "y"
}


# Help: print details for the fourth arguments
#   $1: argument
function args_lvl4()
{
  echo -n "            "
  colorize "$1" $CLR_DPURPLE "y"
}


# Help: print details for the fifth arguments
#   $1: argument
function args_lvl5()
{
  echo -n "                "
  colorize "$1" $CLR_DCYAN "y"
}


# Help: print the help
function args_help()
{
  # Applications
  args_lvl1 "-a" "--apps"
  args_lvl2 "firefox"
  args_lvl3 "-a" "--addons"
  args_lvl2 "vim"
  args_lvl3 "-i" "--install"
  args_lvl4 "base16"
  args_lvl4 "commandt"
  args_lvl4 "delimitmate"
  args_lvl4 "indentline"
  args_lvl4 "multiplecursors"
  args_lvl4 "nerdtree"
  args_lvl4 "pathogen"
  args_lvl4 "surround"
  args_lvl4 "taglist"
  args_lvl4 "youcompleteme"
  args_lvl2 "xmonad"
  args_lvl3 "-i" "--install"
  args_lvl3 "-u" "--update"
  # Help
  args_lvl1 "-h" "--help"
  # OS
  args_lvl1 "-o" "--os"
  args_lvl2 "debian"
  args_lvl3 "-i" "--install"
  args_lvl4 "colorscheme"
  args_lvl4 "dev"
  args_lvl4 "gui"
  args_lvl4 "media"
  args_lvl4 "network"
  args_lvl4 "utils"
  args_lvl3 "-u" "--update"
  args_lvl4 "shell"
  # PC
  args_lvl1 "-p" "--pc"
  args_lvl2 "lenovox250"
  args_lvl3 "-i" "--install"
  args_lvl4 "debian"
  args_lvl5 "audio"
  args_lvl5 "wifi"
  args_lvl5 "wifiadapter"
}


########################################################################################################################
# Debian: installation of packages
#   $1: next argument
function args_os_debian_install()
{
  case $1 in
    colorscheme) debian_install_colorscheme ;;       # Debian install: colorscheme
            dev) debian_install_dev ;;               # Debian install: dev
            gui) debian_install_gui ;;               # Debian install: gui
          media) debian_install_media ;;             # Debian install: media
        network) debian_install_network ;;           # Debian install: network
          utils) debian_install_utils ;;             # Debian install: utils
              *) args_invalid $1 ;;                  # Debian install: Invalid argument
  esac
}


# Debian: updates for some options
#   $1: next argument
function args_os_debian_update()
{
  case $1 in
    shell) debian_update_shell ;;                    # Debian update: shell
        *) args_invalid $1 ;;                        # Debian update: Invalid argument
  esac
}


########################################################################################################################
# Lenovo X250: installation of packages
#   $1: next argument
function args_pc_lenovox250_debian_install()
{
  case $1 in
          audio) lenovox250_debian_audio ;;          # Lenovo X250 Debian install: audio
           wifi) lenovox250_debian_wifi ;;           # Lenovo X250 Debian install: wifi
    wifiadapter) lenovox250_debian_wifiadapter ;;    # Lenovo X250 Debian install: wifi adapter
              *) args_invalid $1 ;;                  # Lenovo X250 Debian install: Invalid argument
  esac
}
