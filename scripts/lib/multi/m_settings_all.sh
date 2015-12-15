#!/bin/bash

########################################################################################################################
# Multi | Settings | Set all applications
function m_settings-all_set()
{
  # Base16
  ctp-colorizer "[1/$STP_M_SET_ALL] Setting all applications on Multi OS (Base16)..." $CLR_LCYAN "y"
  m_settings-base16_set
  ctp-colorizer "[1/$STP_M_SET_ALL] Setting all applications on Multi OS (Base16)..." $CLR_LCYAN "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # Firefox
  ctp-colorizer "[2/$STP_M_SET_ALL] Setting all applications on Multi OS (Firefox)..." $CLR_LCYAN "y"
  m_settings-firefox_set
  ctp-colorizer "[2/$STP_M_SET_ALL] Setting all applications on Multi OS (Firefox)..." $CLR_LCYAN "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # MPD
  ctp-colorizer "[3/$STP_M_SET_ALL] Setting all applications on Multi OS (MPD)..." $CLR_LCYAN "y"
  m_settings-mpd_set
  ctp-colorizer "[3/$STP_M_SET_ALL] Setting all applications on Multi OS (MPD)..." $CLR_LCYAN "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # rTorrent
  ctp-colorizer "[4/$STP_M_SET_ALL] Setting all applications on Multi OS (rTorrent)..." $CLR_LCYAN "y"
  m_settings-rtorrent_set
  ctp-colorizer "[4/$STP_M_SET_ALL] Setting all applications on Multi OS (rTorrent)..." $CLR_LCYAN "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # vim
  ctp-colorizer "[5/$STP_M_SET_ALL] Setting all applications on Multi OS (vim)..." $CLR_LCYAN "y"
  m_settings-vim_set
  ctp-colorizer "[5/$STP_M_SET_ALL] Setting all applications on Multi OS (vim)..." $CLR_LCYAN "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # xmonad
  ctp-colorizer "[6/$STP_M_SET_ALL] Setting all applications on Multi OS (xmonad)..." $CLR_LCYAN "y"
  m_settings-xmonad_set
  ctp-colorizer "[6/$STP_M_SET_ALL] Setting all applications on Multi OS (xmonad)..." $CLR_LCYAN "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # Zsh
  ctp-colorizer "[7/$STP_M_SET_ALL] Setting all applications on Multi OS (Zsh)..." $CLR_LCYAN "y"
  m_settings-zsh_set
  ctp-colorizer "[7/$STP_M_SET_ALL] Setting all applications on Multi OS (Zsh)..." $CLR_LCYAN "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # Bluetooth
  ctp-colorizer "[8/$STP_M_SET_ALL] Setting all applications on Multi OS (Bluetooth)..." $CLR_LCYAN "y"
  m_settings-bluetooth_set
  ctp-colorizer "[8/$STP_M_SET_ALL] Setting all applications on Multi OS (Bluetooth)..." $CLR_LCYAN "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
}
