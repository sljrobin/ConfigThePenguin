#!/bin/bash

########################################################################################################################
# Debian | Packages | Install main Packages for miscellaneous tools
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
function __d_packages_utils_main()
{
  aptitude install \
    bc \
    calibre \
    evince \
    newsbeuter \
    p7zip \
    tmux \
    tree \
    unrar \
    unzip \
    weechat \
    xpdf \
    zsh
}


########################################################################################################################
# Debian | Packages | Install Packages for miscellaneous tools
function d_packages_utils()
{
  # Utils | Main packages
  colorize "[1/${STP_D_PKG_UTILS}] Installing Debian Utils Packages (Main)..." $CLR_LBLUE "y"
  __d_packages_utils_main
  colorize "[1/${STP_D_PKG_UTILS}] Installing Debian Utils Packages (Main)..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
}
