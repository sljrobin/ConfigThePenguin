#!/bin/bash
#
#        Filename: d_packages_utils.sh
#     Description: ConfigThePenguin | Debian - Packages - Utils
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-02-10 21:26:29
#        Modified: 2016-02-10 21:44:02
#
########################################################################################################################
# Debian | Packages | Install Packages for miscellaneous tools
#    aspell-fr: spell checker
#    bc: calculator
#    calibre: ePUB viewer
#    evince: PDF viewer
#    newsbeuter: RSS feed reader
#    p7zip: handle .7zip archives
#    tmux: terminal multiplexer
#    tree: recursive directory listing program
#    unrar: handle .rar archives
#    unzip: handle .zip archives
#    xpdf: PDF viewer
#    zsh: Z shell
function d_packages-utils_install()
{
  # List
  plutils=$(whiptail --title "Debian | Packages | Utils" --checklist \
    "\nSelect Debian Packages to install for Utils" 20 61 12 \
    "aspell-fr" "Spell checker" ON \
    "bc" "Calculator" ON \
    "calibre" "ePUB viewer" ON \
    "evince" "PDF viewer" ON \
    "newsbeuter" "RSS feed reader" ON \
    "p7zip" "Handle .7zip archives" ON \
    "tmux" "Terminal multiplexer" ON \
    "tree" "Recursive directory listing program" ON \
    "unrar" "Handle .rar archives" ON \
    "unzip" "Handle .zip archives" ON \
    "xpdf" "PDF viewer" ON \
    "zsh" "Z shell" ON 3>&1 1>&2 2>&3)
  # Exit status
  pl_status=$?
  # 'OK' option selected
  if [ $pl_status = 0 ]; then
    ctp-pkgs_d-install "Utils" $STP_D_PKG_UTILS "$plutils"
  # 'Cancel' option selected
  else
    __ctp-pkgs_d-abort
    exit 1
  fi
}
