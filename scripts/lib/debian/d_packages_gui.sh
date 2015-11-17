#!/bin/bash

########################################################################################################################
# Debian | Packages | Install main Packages for GUI
#    xmonad: GUI
#    xorg: X window system
#    xserver-xorg-core: xserver
function __d_packages_gui_main()
{
  aptitude install \
    xorg \
    xserver-xorg-core \
    xmonad \
}


########################################################################################################################
# Debian | Packages | Install miscellaneous Packages for GUI
#    conky: system monitor
#    dzen2: notifications for X11
#    fonts-droid: 'Droid Sans Mono' font
#    gmrun: application launcher
#    rxvt-unicode-256color: terminal emulator with Unicode support
#    suckless-tools: dmenu
#    xbacklight: tool to manage brightness
#    xscreensaver: a screensaver
function __d_packages_gui_misc()
{
  aptitude install \
    conky \
    dzen2 \
    fonts-droid \
    gmrun \
    rxvt-unicode-256color \
    suckless-tools \
    xbacklight \
    xscreensaver
}


########################################################################################################################
# Debian | Packages | Install Packages for GUI
function d_packages_gui()
{
  # GUI | Main packages
  colorize "[1/${STP_D_PKG_GUI}] Installing Debian GUI Packages (Main)..." $CLR_LBLUE "y"
  __d_packages_gui_main
  colorize "[1/${STP_D_PKG_GUI}] Installing Debian GUI Packages (Main)..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
  # GUI | Miscellaneous packages
  colorize "[2/${STP_D_PKG_GUI}] Installing Debian GUI Packages (Misc)..." $CLR_LBLUE "y"
  __d_packages_gui_misc
  colorize "[2/${STP_D_PKG_GUI}] Installing Debian GUI Packages (Misc)..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
}
