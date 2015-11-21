#!/bin/bash

########################################################################################################################
# Multi | Settings | Firefox: show details of an add-on
#   $1: add-on's name
#   $2: add-on's URL
function __m_settings_firefox_addonsdetails()
{
  colorize "> $1" $CLR_DPURPLE "n"
  echo -n " => "
  colorize "$2" $CLR_DCYAN "y"
}


########################################################################################################################
# Multi | Settings | Firefox: show all add-ons details
function m_settings_firefox()
{
  colorize "[1/${STP_M_SET_FIREFOX}] Showing all addons details..." $CLR_LBLUE "y"
  __m_settings_firefox_addonsdetails "$FFA_BLANKMONITORREADING_NME" "$FFA_BLANKMONITORREADING_URL"
  __m_settings_firefox_addonsdetails "$FFA_DISCONNECT_NME" "$FFA_DISCONNECT_URL"
  __m_settings_firefox_addonsdetails "$FFA_FLAGFOX_NME" "$FFA_FLAGFOX_URL"
  __m_settings_firefox_addonsdetails "$FFA_FTDEEPDARK_NME" "$FFA_FTDEEPDARK_URL"
  __m_settings_firefox_addonsdetails "$FFA_GOOGLE_SSL_SEARCH_NME" "$FFA_GOOGLE_SSL_SEARCH_URL"
  __m_settings_firefox_addonsdetails "$FFA_HTTPSEVERYWHERE_NME" "$FFA_HTTPSEVERYWHERE_URL"
  __m_settings_firefox_addonsdetails "$FFA_NOSCRIPT_NME" "$FFA_NOSCRIPT_URL"
  __m_settings_firefox_addonsdetails "$FFA_SELFDESTRUCTINGCOOKIES_NME" "$FFA_SELFDESTRUCTINGCOOKIES_URL"
  __m_settings_firefox_addonsdetails "$FFA_STATUS4EVAR_NME" "$FFA_STATUS4EVAR_URL"
  __m_settings_firefox_addonsdetails "$FFA_TABMIXPLUS_NME" "$FFA_TABMIXPLUS_URL"
  __m_settings_firefox_addonsdetails "$FFA_UBLOCKORIGIN_NME" "$FFA_UBLOCKORIGIN_URL"
  __m_settings_firefox_addonsdetails "$FFA_WORDREFERENCETRANSLATOR_NME" "$FFA_WORDREFERENCETRANSLATOR_URL"
  colorize "[1/${STP_M_SET_FIREFOX}] Showing all addons details..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
}
