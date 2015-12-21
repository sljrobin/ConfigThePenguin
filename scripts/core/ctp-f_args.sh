#!/bin/bash
#
#        Filename: ctp-args.sh
#     Description: 
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-05 15:03:13
#        Modified: 2015-12-13 09:21:01
#
########################################################################################################################
# Arguments | Errors | Print an error message when an invalid argument is entered
#   $1: next argument
function ctp-args_errors-ivld()
{
  ctp-colorizer "Error: '$1' is an invalid argument" $CLR_LRED "y"
}

# Arguments | Errors | Print an error message when there is an insufficient number of arguments
function ctp-args_errors-isfc()
{
  ctp-colorizer "Error: Insufficient number of arguments" $CLR_LRED "y"
}


########################################################################################################################
# Arguments | Help | Level 1 argument
#   $1: argument
#   $2: argument description
function __ctp-args_help-lvl1()
{
  ctp-colorizer "    $1" $CLR_LBLUE "n"
  echo ": $2"
}

# Arguments | Help | Level 1 argument with a second option
#   $1: argument short version
#   $2: argument long version
#   $3: argument description
function __ctp-args_help-lvl1or()
{
  ctp-colorizer "    $1" $CLR_LBLUE "n"
  echo -n " | "
  ctp-colorizer "$2" $CLR_LBLUE "n"
  echo ": $3"
}

# Arguments | Help | Level 2 argument
#   $1: argument
#   $2: argument description
function __ctp-args_help-lvl2()
{
  ctp-colorizer "        $1" $CLR_LORANGE "n"
  echo ": $2"
}

# Arguments | Help | Level 2 argument with a second option
#   $1: argument short version
#   $2: argument long version
#   $3: argument description
function __ctp-args_help-lvl2or()
{
  ctp-colorizer "        $1" $CLR_LORANGE "n"
  echo -n " | "
  ctp-colorizer "$2" $CLR_LORANGE "n"
  echo ": $3"
}

# Arguments | Help | Show the help
function ctp-args_help-show()
{
  # Syntax
  ctp-colorizer "Syntax: ./main.sh <argument 1><argument 2> <argument 3>" $CLR_LPURPLE "y"
  # Help
  __ctp-args_help-lvl1or "-H" "--help" "print this help"
  # Debian | Drivers
  __ctp-args_help-lvl1 "-dd" "Debian drivers"
  __ctp-args_help-lvl2 "lenovo-x250" "drivers for Lenovo ThinkPad X250"
  # Debian | Packages
  __ctp-args_help-lvl1 "-dp" "Debian packages"
  __ctp-args_help-lvl2or "-A" "--all" "all packages"
  __ctp-args_help-lvl2or "-d" "--development" "packages for development"
  __ctp-args_help-lvl2or "-g" "--gui" "packages for GUI"
  __ctp-args_help-lvl2or "-m" "--media" "packages for media (audio/video)"
  __ctp-args_help-lvl2or "-n" "--network" "packages for network"
  __ctp-args_help-lvl2or "-u" "--utils" "packages for miscellaneous tools"
  # Multi | Dotfiles
  __ctp-args_help-lvl1 "-m." "Multi dotfiles"
  # Multi | Settings
  __ctp-args_help-lvl1 "-ms" "Multi settings"
  __ctp-args_help-lvl2or "-A" "--all" "all settings"
  __ctp-args_help-lvl2 "base16" "clone repository from GitHub"
  __ctp-args_help-lvl2 "bluetooth" "disable permanently Bluetooth"
  __ctp-args_help-lvl2 "firefox" "print details for add-ons"
  __ctp-args_help-lvl2 "mpd" "create directories for MPD"
  __ctp-args_help-lvl2 "rtorrent" "create directories for rTorrent"
  __ctp-args_help-lvl2 "vim" "install plugins"
  __ctp-args_help-lvl2 "xmonad" "compile xmonad with the main configuration file"
  __ctp-args_help-lvl2 "zsh" "change the current shell to Zsh"
  echo
}


########################################################################################################################
# Arguments | Options | Debian - Drivers
function ctp-args_options-dd()
{
  case $1 in
    # Debian | Drivers > Lenovo X250
    lenovo-x250) d_drivers-lenovox250_install ;;
    # Debian | Drivers > Errors
    *) ctp-args_errors-ivld $1 ;;
  esac
}

# Arguments | Options | Debian - Packages
function ctp-args_options-dp()
{
  case $1 in
    # Debian | Packages > All
    -A | --all) d_packages-all_install ;;
    # Debian | Packages > Development
    -d | --development) d_packages-dev_install ;;
    # Debian | Packages > GUI
    -g | --gui) d_packages-gui_install ;;
    # Debian | Packages > Media
    -m | --media) d_packages-media_install ;;
    # Debian | Packages > Network
    -n | --network) d_packages-net_install ;;
    # Debian | Packages > Utils
    -u | --utils) d_packages-utils_install ;;
    # Debian | Packages > Errors
    -*) ctp-args_errors-ivld $1 ;;
     *) ctp-args_errors-isfc $1 ;;
  esac
}


########################################################################################################################
# Arguments | Options | Multi - Dotfiles
function ctp-args_options-mdot()
{
  m_dotfiles_link
}

# Arguments | Options | Multi - Settings
function ctp-args_options-ms()
{
  case $1 in
    # Multi | Settings > All
    -A | --all) m_settings-all_set ;;
    # Multi | Settings > Base16
    base16) m_settings-base16_set ;;
    # Multi | Settings > Bluetooth
    bluetooth) m_settings-bluetooth_set ;;
    # Multi | Settings > Firefox
    firefox) m_settings-firefox_set ;;
    # Multi | Settings > MPD
    mpd) m_settings-mpd_set ;;
    # Multi | Settings > rTorrent
    rtorrent) m_settings-rtorrent_set ;;
    # Multi | Settings > vim
    vim) m_settings-vim_set ;;
    # Multi | Settings > xmonad
    xmonad) m_settings-xmonad_set ;;
    # Multi | Settings > zsh
    zsh) m_settings-zsh_set ;;
    # Multi | Settings > Errors
    *) ctp-args_errors-ivld $1 ;;
  esac
}
