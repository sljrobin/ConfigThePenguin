#!/bin/bash

########################################################################################################################
# Multi | Settings | Firefox: show details of an add-on
#   $1: add-on's name
#   $2: add-on's URL
function __m_settings-firefox_addondetails()
{
  ctp-colorizer "> $1" $CLR_DPURPLE "n"
  echo -n " => "
  ctp-colorizer "$2" $CLR_DCYAN "y"
}


########################################################################################################################
# Multi | Settings | Firefox: show all add-ons details
function m_settings-firefox_set()
{
  ctp-colorizer "[1/${STP_M_SET_FIREFOX}] Showing all addons details..." $CLR_LBLUE "y"
  __m_settings-firefox_addondetails "$FFA_BLANKMONITORREADING_NME" "$FFA_BLANKMONITORREADING_URL"
  __m_settings-firefox_addondetails "$FFA_DISCONNECT_NME" "$FFA_DISCONNECT_URL"
  __m_settings-firefox_addondetails "$FFA_FLAGFOX_NME" "$FFA_FLAGFOX_URL"
  __m_settings-firefox_addondetails "$FFA_FTDEEPDARK_NME" "$FFA_FTDEEPDARK_URL"
  __m_settings-firefox_addondetails "$FFA_CALOMEL_SSL_VALIDATION_NME" "$FFA_CALOMEL_SSL_VALIDATION_URL"
  __m_settings-firefox_addondetails "$FFA_GOOGLE_SSL_SEARCH_NME" "$FFA_GOOGLE_SSL_SEARCH_URL"
  __m_settings-firefox_addondetails "$FFA_HTTPSEVERYWHERE_NME" "$FFA_HTTPSEVERYWHERE_URL"
  __m_settings-firefox_addondetails "$FFA_NOSCRIPT_NME" "$FFA_NOSCRIPT_URL"
  __m_settings-firefox_addondetails "$FFA_SELFDESTRUCTINGCOOKIES_NME" "$FFA_SELFDESTRUCTINGCOOKIES_URL"
  __m_settings-firefox_addondetails "$FFA_STATUS4EVAR_NME" "$FFA_STATUS4EVAR_URL"
  __m_settings-firefox_addondetails "$FFA_TABMIXPLUS_NME" "$FFA_TABMIXPLUS_URL"
  __m_settings-firefox_addondetails "$FFA_UBLOCKORIGIN_NME" "$FFA_UBLOCKORIGIN_URL"
  __m_settings-firefox_addondetails "$FFA_WAPPALYZER_NME" "$FFA_WAPPALYZER_URL"
  __m_settings-firefox_addondetails "$FFA_WORDREFERENCETRANSLATOR_NME" "$FFA_WORDREFERENCETRANSLATOR_URL"
  ctp-colorizer "[1/${STP_M_SET_FIREFOX}] Showing all addons details..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
}
