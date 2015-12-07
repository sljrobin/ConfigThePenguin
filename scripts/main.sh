#!/bin/bash
#
#        Filename: main.sh
#     Description: ConfigThePenguin - Main script 
#          Author: Simon L. J. Robin - http://sljrobin.com
#         Created: 2015-10-18 15:20:37
#        Modified: 2015-12-06 01:33:04
#
########################################################################################################################
# Load Core
source ./core/ctp-f_args.sh
source ./core/ctp-f_clrz.sh
source ./core/ctp-f_dots.sh
source ./core/ctp-f_pkgs.sh
source ./core/ctp-f_prsr.sh
source ./core/ctp-v_clrs.sh
source ./core/ctp-v_dirs.sh
source ./core/ctp-v_ffad.sh
source ./core/ctp-v_srcs.sh
source ./core/ctp-v_stps.sh

# Load Library
source ./lib/debian/d_drivers_lenovo-x250.sh
source ./lib/debian/d_packages_all.sh
source ./lib/debian/d_packages_dev.sh
source ./lib/debian/d_packages_gui.sh
source ./lib/debian/d_packages_media.sh
source ./lib/debian/d_packages_network.sh
source ./lib/debian/d_packages_utils.sh
source ./lib/multi/m_dotfiles.sh
source ./lib/multi/m_settings_all.sh
source ./lib/multi/m_settings_base16.sh
source ./lib/multi/m_settings_firefox.sh
source ./lib/multi/m_settings_mpd.sh
source ./lib/multi/m_settings_rtorrent.sh
source ./lib/multi/m_settings_vim.sh
source ./lib/multi/m_settings_xmonad.sh
source ./lib/multi/m_settings_zsh.sh


########################################################################################################################
while true; do
  case $1 in
    # Help
    -H | --help) shift; ctp-args_help-show; break ;;
    # Debian | Drivers
    -dd) shift; ctp-args_options-dd $1; break ;;
    # Debian | Packages
    -dp) shift; ctp-args_options-dp $1; break ;;
    # Multi | Dotfiles
    -m.) shift; ctp-args_options-mdot $1; break ;;
    # Multi | Settings
    -ms) shift; ctp-args_options-ms $1; break ;;
    # Errors
    -*) ctp-args_errors-ivld $1; break ;;
     *) ctp-args_errors-isfc $1; break ;;
  esac
done
