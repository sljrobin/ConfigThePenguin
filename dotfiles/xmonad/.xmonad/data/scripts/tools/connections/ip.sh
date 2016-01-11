#!/bin/bash
#
#        Filename: ip.sh
#     Description: Tool for IP information
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-29 13:33:29
#        Modified: 2015-12-31 21:32:17
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# IP | Get public address
function __xmdt_ip-getpubaddr()
{
  local ip_public=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')  # Get Public IP

  echo $ip_public
}


################################################################################
# IP | Get country
function __xmdt_ip-getcountry()
{
  local ip_public=$(__xmdt_ip-getpubaddr)
  local ip_country=$(geoiplookup $ip_public | cut -d' ' -f4 | tr -cd '[[:alnum:]]._-')

  xmdl_icns-show $ICON_FLAG
  xmdl_pntr-txt $COLOR_LGREY $ip_country
}


################################################################################
# IP | Main
function xmdt_ip()
{
  __xmdt_ip-getcountry
}


########################################################################################################################
xmdt_ip
