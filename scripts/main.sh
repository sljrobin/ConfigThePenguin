#!/bin/bash
#
#        Filename: main.sh
#     Description: ConfigThePenguin - Main script 
#          Author: Simon L. J. Robin - http://sljrobin.com
#         Created: 2015-10-18 15:20:37
#        Modified: 2015-12-05 18:57:32
#
########################################################################################################################
# Load Core
source ./core/ctp-v_colors.sh
source ./core/ctp-v_dirs.sh
source ./core/ctp-v_ffadds.sh
source ./core/ctp-v_sources.sh
source ./core/ctp-v_steps.sh
source ./core/ctp-f_args.sh
source ./core/ctp-f_colorizer.sh
source ./core/ctp-f_parser.sh
source ./core/ctp-f_pkgs.sh

# Load Library
source ./lib/debian/d_drivers_lenovo-x250.sh
source ./lib/debian/d_packages_all.sh
source ./lib/debian/d_packages_dev.sh
source ./lib/debian/d_packages_gui.sh
source ./lib/debian/d_packages_media.sh
source ./lib/debian/d_packages_network.sh
source ./lib/debian/d_packages_utils.sh
source ./lib/multi/m_settings_firefox.sh
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
    # Multi | Settings
    -ms) shift; ctp-args_options-ms $1; break ;;
    # Errors
    -*) ctp-args_errors-ivld $1; break ;;
     *) ctp-args_errors-isfc $1; break ;;
  esac
done
