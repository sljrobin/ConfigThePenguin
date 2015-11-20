#!/bin/bash

########################################################################################################################
# Colors - Dark
CLR_DBLACK='\033[0;30m'                                                                                       # Color: Dark Black
CLR_DBLUE='\033[0;34m'                                                                                        # Color: Dark Blue
CLR_DCYAN='\033[0;36m'                                                                                        # Color: Dark Cyan
CLR_DGRAY='\033[1;30m'                                                                                        # Color: Dark Gray
CLR_DGREEN='\033[0;32m'                                                                                       # Color: Dark Green
CLR_DORANGE='\033[0;33m'                                                                                      # Color: Dark Orange
CLR_DPURPLE='\033[0;35m'                                                                                      # Color: Dark Purple
CLR_DRED='\033[0;31m'                                                                                         # Color: Dark Red
CLR_DWHITE='\033[1;37m'                                                                                       # Color: Dark White

# Colors - Light
CLR_LBLUE='\033[1;34m'                                                                                        # Color: Light Blue
CLR_LCYAN='\033[1;36m'                                                                                        # Color: Light Cyan
CLR_LGRAY='\033[0;37m'                                                                                        # Color: Light Gray
CLR_LGREEN='\033[1;32m'                                                                                       # Color: Light Green
CLR_LORANGE='\033[1;33m'                                                                                      # Color: Light Orange
CLR_LPURPLE='\033[1;35m'                                                                                      # Color: Light Purple
CLR_LRED='\033[1;31m'                                                                                         # Color: Light Red

# Colors - Miscellaneous
CLR_RESET='\033[0m'                                                                                           # Color: Reset


########################################################################################################################
# Directories - Shell
DIR_SH_BASH="/bin/bash"                                                                                       # Directory Shell: Bash
DIR_SH_ZSH1="/bin/zsh"                                                                                        # Directory Shell: Zsh (option 1)
DIR_SH_ZSH2="/usr/bin/zsh"                                                                                    # Directory Shell: Zsh (option 2)

# Directories - rTorrent
DIR_RTORRENTRC="$HOME/.rtorrent.rc"                                                                           # Directory rTorrent: .rtorrent.rc
DIR_RTORRENT_HOMEDL="$HOME/Downloads"                                                                         # Directory rTorrent: HOME/Downloads directory
DIR_RTORRENT_MAIN="$HOME/.rtorrent"                                                                           # Directory rTorrent: Main directory
DIR_RTORRENT_DOWNLOADS="$HOME/.rtorrent/downloads"                                                            # Directory rTorrent: Downloads directory
DIR_RTORRENT_SESSION="$HOME/.rtorrent/session"                                                                # Directory rTorrent: Session directory
DIR_RTORRENT_TORRENTS="$HOME/.rtorrent/torrents"                                                              # Directory rTorrent: Torrents directory

# Directories - xmonad
DIR_XMONAD_REPO="../dotfiles/.xmonad"                                                                         # Directory xmonad: on the repo
DIR_XMONAD_OS="$HOME/.xmonad"                                                                                 # Directory xmonad: on the OS


########################################################################################################################
# Add-ons Firefox - Appearence
FFA_BLANKMONITORREADING_NME="Blank Your Monitor + Easy Reading"                                               # Firefox Add-on: 'Blank Your Monitor + Easy Reading' Name
FFA_BLANKMONITORREADING_URL="https://addons.mozilla.org/en-us/firefox/addon/blank-your-monitor-easy-readin/"  # Firefox Add-on: 'Blank Your Monitor + Easy Reading' URL
FFA_FTDEEPDARK_NME="FT DeepDark"                                                                              # Firefox Add-on: 'FT DeepDark' Name
FFA_FTDEEPDARK_URL="https://addons.mozilla.org/en-us/firefox/addon/ft-deepdark/"                              # Firefox Add-on: 'FT DeepDark' URL
FFA_TABMIXPLUS_NME="Tab Mix Plus"                                                                             # Firefox Add-on: 'Tab Mix Plus' Name
FFA_TABMIXPLUS_URL="https://addons.mozilla.org/en-us/firefox/addon/tab-mix-plus/"                             # Firefox Add-on: 'Tab Mix Plus' URL

# Add-ons Firefox - Adds & Trackers
FFA_DISCONNECT_NME="Disconnect"                                                                               # Firefox Add-on: 'Disconnect' Name
FFA_DISCONNECT_URL="https://addons.mozilla.org/en-us/firefox/addon/disconnect/"                               # Firefox Add-on: 'Disconnect' URL
FFA_SELFDESTRUCTINGCOOKIES_NME="Self-Destructing Cookies"                                                     # Firefox Add-on: 'Self-Destructing Cookies' Name
FFA_SELFDESTRUCTINGCOOKIES_URL="https://addons.mozilla.org/en-us/firefox/addon/self-destructing-cookies/"     # Firefox Add-on: 'Self-Destructing Cookies' URL
FFA_UBLOCKORIGIN_NME="uBlock Origin"                                                                          # Firefox Add-on: 'uBlock Origin' Name
FFA_UBLOCKORIGIN_URL="https://addons.mozilla.org/en-us/firefox/addon/ublock-origin/"                          # Firefox Add-on: 'uBlock Origin' URL

# Add-ons Firefox - Security
FFA_GOOGLE_SSL_SEARCH_NME="Google SSL Search"                                                                 # Firefox Add-on: 'Google SSL Search' Name
FFA_GOOGLE_SSL_SEARCH_URL="https://addons.mozilla.org/en-US/firefox/addon/google-ssl-search/"                 # Firefox Add-on: 'Google SSL Search' URL
FFA_HTTPSEVERYWHERE_NME="HTTPS Everywhere"                                                                    # Firefox Add-on: 'HTTPS Everywhere' Name
FFA_HTTPSEVERYWHERE_URL="https://addons.mozilla.org/en-us/firefox/addon/https-everywhere/"                    # Firefox Add-on: 'HTTPS Everywhere' URL
FFA_NOSCRIPT_NME="NoScript Security Suite"                                                                    # Firefox Add-on: 'NoScript Security Suite' Name
FFA_NOSCRIPT_URL="https://addons.mozilla.org/en-US/firefox/addon/noscript/"                                   # Firefox Add-on: 'NoScript Security Suite' URL

# Add-ons Firefox - Miscellaneous
FFA_FLAGFOX_NME="Flagfox"                                                                                     # Firefox Add-on: 'Flagfox' Name
FFA_FLAGFOX_URL="https://addons.mozilla.org/en-us/firefox/addon/flagfox/"                                     # Firefox Add-on: 'Flagfox' URL
FFA_STATUS4EVAR_NME="Status-4-Evar"                                                                           # Firefox Add-on: 'Status-4-Evar' Name
FFA_STATUS4EVAR_URL="https://addons.mozilla.org/en-US/firefox/addon/status-4-evar/"                           # Firefox Add-on: 'Status-4-Evar' URL
FFA_WORDREFERENCETRANSLATOR_NME="WordReference Translator"                                                    # Firefox Add-on: 'WordReference Translator' Name
FFA_WORDREFERENCETRANSLATOR_URL="https://addons.mozilla.org/En-us/firefox/addon/wordreference-translator/"    # Firefox Add-on: 'WordReference Translator' URL


########################################################################################################################
# Steps - Apps
# rTorrent
STP_RTORRENT_INSTALL='4'                                                                                      # Steps | Apps: rTorrent install
# vim
STP_VIM_BASE16='2'                                                                                            # Steps | Apps: vim's Base16
STP_VIM_COMMANDT='5'                                                                                          # Steps | Apps: vim's Command-T
STP_VIM_DELIMITMATE='2'                                                                                       # Steps | Apps: vim's delimitMate
STP_VIM_INDENTLINE='2'                                                                                        # Steps | Apps: vim's indentLine
STP_VIM_MULTIPLECURSORS='2'                                                                                   # Steps | Apps: vim's vim-multiple-cursors
STP_VIM_NERDTREE='2'                                                                                          # Steps | Apps: vim's NERD Tree
STP_VIM_PATHOGEN='4'                                                                                          # Steps | Apps: vim's Pathogen
STP_VIM_SURROUND='2'                                                                                          # Steps | Apps: vim's Surround
STP_VIM_TAGLIST='4'                                                                                           # Steps | Apps: vim's Taglist 
STP_VIM_YOUCOMPLETEME='5'                                                                                     # Steps | Apps: vim's YouCompleteMe
# xmonad
STP_XMD_UPDATE='6'                                                                                            # Steps | Apps: xmonad updating

# Steps - OS
# Debian - Packages
STP_D_PKG_COLORSCHEME='2'                                                                                     # Steps | OS | Debian: main colorscheme
STP_D_PKG_INITIALIZATION='7'                                                                                  # Steps | OS | Debian: initialization

STP_D_PKG_DEV='1'                                                                                             # Steps: Debian | Packages | Dev
STP_D_PKG_GUI='2'                                                                                             # Steps: Debian | Packages | GUI
STP_D_PKG_MEDIA='1'                                                                                           # Steps: Debian | Packages | Media
STP_D_PKG_NET='1'                                                                                             # Steps: Debian | Packages | Net
STP_D_PKG_UTILS='1'                                                                                           # Steps: Debian | Packages | Utils

# Steps - PC
# Lenovo ThinkPad X250 - Drivers
STP_D_DRV_X250='3'                                                                                            # Steps: Debian | Drivers | Lenovo X250
STP_D_DRV_X250_AUDIO='1'                                                                                      # Steps: Debian | Drivers | Lenovo X250: Audio
STP_D_DRV_X250_WIFI='8'                                                                                       # Steps: Debian | Drivers | Lenovo X250: WiFi
STP_D_DRV_X250_WIFIADAPTER='6'                                                                                # Steps: Debian | Drivers | Lenovo X250: WiFi Adapter


STP_M_SET_FIREFOX='1'                                                                                         # Steps: Multi | Settings | Firefox
STP_M_SET_RTORRENT='3'                                                                                        # Steps: Multi | Settings | rTorrent
STP_M_SET_RTORRENT_CHECKDL='1'                                                                                # Steps: Multi | Settings | rTorrent: Check '~/Downloads'
STP_M_SET_RTORRENT_CREATEDIRS='4'                                                                             # Steps: Multi | Settings | rTorrent: Create directories
STP_M_SET_ZSH='1'                                                                                             # Steps: Multi | Settings | Zsh

SRC_D_IWLWIFI="deb http://http.debian.net/debian/ jessie main contrib non-free"                               # Sources: Debian | iwlwifi
SRC_D_FIRMATHEROS="deb http://httpredir.debian.org/debian/ jessie main contrib non-free"                      # Sources: Debian | firmware-atheros

