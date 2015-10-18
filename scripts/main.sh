#!/bin/bash
#
#        Filename: main.sh
#     Description: ConfigThePenguin - Main script 
#          Author: Simon L. J. Robin - http://sljrobin.com
#         Created: 2015-10-18 15:20:37
#        Modified: 2015-10-18 16:03:44
#
########################################################################################## 

# Load Core
source ./core/ctp_var.sh
source ./core/ctp_func.sh

# Load Library: Applications scripts
source ./lib/apps/firefox.sh
source ./lib/apps/vim.sh
source ./lib/apps/xmonad.sh

# Load Library: OS scripts
source ./lib/os/debian/initialization.sh
source ./lib/os/debian/packages.sh

# Load Library: PC scripts 
source ./lib/pc/lenovo-x250_debian.sh

#firefox_addon_show_all

#vim_install_pathogen
#vim_install_base16
#vim_install_commandt
#vim_install_delimitmate
#vim_install_indentline
#vim_install_multiplecursors
#vim_install_nerdtree
#vim_install_surround
#vim_install_taglist
#vim_install_youcompleteme

#xmonad_install

#debian_install_colorscheme
#debian_install_dev
#debian_install_gui
#debian_install_media
#debian_install_network
#debian_install_utils

#lenovox250_debian_wifiadapter
#lenovox250_debian_wifi
#lenovox250_debian_audio
