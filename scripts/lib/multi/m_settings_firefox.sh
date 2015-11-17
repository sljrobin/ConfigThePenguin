#!/bin/bash

########################################################################################################################
# Show the details of an add-on
#   $1: add-on's name
#   $2: add-on's URL
function firefox_addon_show_details()
{
  colorize "$1" $CLR_LBLUE "n"
  echo -n " => "
  colorize "$2" $CLR_LPURPLE "y"
}


########################################################################################################################
# Show all the URLs of all the add-ons
function firefox_addon_show_all()
{
  firefox_addon_show_details "$FFA_BLANKMONITORREADING_NME" "$FFA_BLANKMONITORREADING_URL"
  firefox_addon_show_details "$FFA_DISCONNECT_NME" "$FFA_DISCONNECT_URL"
  firefox_addon_show_details "$FFA_FLAGFOX_NME" "$FFA_FLAGFOX_URL"
  firefox_addon_show_details "$FFA_FTDEEPDARK_NME" "$FFA_FTDEEPDARK_URL"
  firefox_addon_show_details "$FFA_GOOGLE_SSL_SEARCH_NME" "$FFA_GOOGLE_SSL_SEARCH_URL"
  firefox_addon_show_details "$FFA_HTTPSEVERYWHERE_NME" "$FFA_HTTPSEVERYWHERE_URL"
  firefox_addon_show_details "$FFA_NOSCRIPT_NME" "$FFA_NOSCRIPT_URL"
  firefox_addon_show_details "$FFA_SELFDESTRUCTINGCOOKIES_NME" "$FFA_SELFDESTRUCTINGCOOKIES_URL"
  firefox_addon_show_details "$FFA_STATUS4EVAR_NME" "$FFA_STATUS4EVAR_URL"
  firefox_addon_show_details "$FFA_TABMIXPLUS_NME" "$FFA_TABMIXPLUS_URL"
  firefox_addon_show_details "$FFA_UBLOCKORIGIN_NME" "$FFA_UBLOCKORIGIN_URL"
  firefox_addon_show_details "$FFA_WORDREFERENCETRANSLATOR_NME" "$FFA_WORDREFERENCETRANSLATOR_URL"
}
