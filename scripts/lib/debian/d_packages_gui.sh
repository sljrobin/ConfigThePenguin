#!/bin/bash
#
#        Filename: d_packages_gui.sh
#     Description: ConfigThePenguin | Debian - Packages - GUI
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-02-10 21:19:59
#        Modified: 2016-04-08 19:47:46
#
########################################################################################################################
# Debian | Packages | Install Packages for GUI
#    conky: system monitor
#    dzen2: notifications for X11
#    gmrun: application launcher
#    rxvt-unicode-256color: terminal emulator with Unicode support
#    suckless-tools: dmenu
#    ttf-dejavu: 'DejaVu' font
#    xbacklight: tool to manage brightness
#    xmonad: GUI
#    xorg: X window system
#    xscreensaver: a screensaver
#    xserver-xorg-core: xserver
function d_packages-gui_install()
{
  # List
  plgui=$(whiptail --title "Debian | Packages | GUI - Main" --checklist \
    "\nSelect Debian Packages to install for GUI (Main)" 19 75 11 \
    "xorg" "X window system" ON \
    "xserver-xorg-core" "xserver" ON \
    "xmonad" "GUI" ON \
    "conky" "System monitor" ON \
    "dzen2" "Notifications for X11" ON \
    "gmrun" "Application launcher" ON \
    "rxvt-unicode-256color" "Terminal emulator with Unicode support" ON \
    "suckless-tools" "dmenu" ON \
    "ttf-dejavu" "'DejaVu' font" ON \
    "xbacklight" "Tool to manage brightness" ON \
    "xscreensaver" "A screensaver" ON 3>&1 1>&2 2>&3)
  # Exit status
  pl_status=$?
  # 'OK' option selected
  if [ $pl_status = 0 ]; then
    ctp-pkgs_d-install "GUI" $STP_D_PKG_GUI "$plgui"
  # 'Cancel' option selected
  else
    __ctp-pkgs_d-abort
    exit 1
  fi
}
