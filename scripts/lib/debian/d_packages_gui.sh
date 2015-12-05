#!/bin/bash

########################################################################################################################
# Debian | Packages | List Packages for GUI
#    conky: system monitor
#    dzen2: notifications for X11
#    fonts-droid: 'Droid Sans Mono' font
#    gmrun: application launcher
#    rxvt-unicode-256color: terminal emulator with Unicode support
#    suckless-tools: dmenu
#    xbacklight: tool to manage brightness
#    xmonad: GUI
#    xorg: X window system
#    xscreensaver: a screensaver
#    xserver-xorg-core: xserver
function __d_packages-gui_list()
{
  # List
  plgui=$(whiptail --title "Debian | Packages | GUI - Main" --checklist \
    "\nSelect Debian Packages to install for GUI (Main)" 19 75 11 \
    "xorg" "X window system" ON \
    "xserver-xorg-core" "xserver" ON \
    "xmonad" "GUI" ON \
    "conky" "System monitor" ON \
    "dzen2" "Notifications for X11" ON \
    "fonts-droid" "'Droid Sans Mono' font" ON \
    "gmrun" "Application launcher" ON \
    "rxvt-unicode-256color" "Terminal emulator with Unicode support" ON \
    "suckless-tools" "dmenu" ON \
    "xbacklight" "Tool to manage brightness" ON \
    "xscreensaver" "A screensaver" ON 3>&1 1>&2 2>&3)
  # Exit status
  pl_status=$?
  # 'OK' option selected
  if [ $pl_status = 0 ]; then
    # Clean the package list
    pl_cleaned=$(ctp-parser_rmdquotes "$plgui")
    echo $pl_cleaned
  # 'Cancel' option selected
  else
    __ctp-pkgs_d-abort
    exit 1
  fi
}


########################################################################################################################
# Debian | Packages | Install Packages for GUI
function d_packages-gui_install()
{
  ctp-pkgs_d-install "GUI" $STP_D_PKG_GUI __d_packages-gui_list 
}
