#!/bin/bash

########################################################################################################################
# Debian | Packages | List Packages for miscellaneous tools
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
#    weechat: IRC client
#    xpdf: PDF viewer
#    zsh: Z shell
function __d_packages-utils_list()
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
    "weechat" "IRC client" ON \
    "xpdf" "PDF viewer" ON \
    "zsh" "Z shell" ON 3>&1 1>&2 2>&3)
  # Exit status
  pl_status=$?
  # 'OK' option selected
  if [ $pl_status = 0 ]; then
    # Clean the package list
    pl_cleaned=$(ctp-parser_rmdquotes "$plutils")
    echo $pl_cleaned
  # 'Cancel' option selected
  else
    __ctp-pkgs_d-abort
    exit 1
  fi
}


########################################################################################################################
# Debian | Packages | Install Packages for miscellaneous tools
function d_packages-utils_install()
{
  ctp-pkgs_d-install "Utils" $STP_D_PKG_UTILS __d_packages-utils_list 
}
