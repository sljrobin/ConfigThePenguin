#!/bin/bash

########################################################################################################################
# Debian | Drivers | Lenovo X250: Install Audio drivers
function __d_drivers-lenovox250-audio()
{
  ctp-colorizer "> [1/${STP_D_DRV_X250_AUDIO}] Changing the audio card's order" $CLR_DPURPLE "y"
  echo "options snd_hda_intel index=1 model=thinkpad" >> /etc/modprobe.d/sound.conf
  ctp-colorizer "> A reboot is necessary" $CLR_DORANGE "y"
}


########################################################################################################################
# Debian | Drivers | Lenovo X250: Install WiFi drivers
function __d_drivers-lenovox250-wifi()
{
  ctp-colorizer "> [1/${STP_D_DRV_X250_WIFI}] Adding APT source ('$SRC_D_IWLWIFI')" $CLR_DPURPLE "y"
  echo ${SRC_D_IWLWIFI} >> /etc/apt/sources.list
  ctp-colorizer "> [2/${STP_D_DRV_X250_WIFI}] apt-get updating" $CLR_DPURPLE "y"
  aptitude update
  ctp-colorizer "> [3/${STP_D_DRV_X250_WIFI}] apt-get upgrading" $CLR_DPURPLE "y"
  aptitude upgrade
  ctp-colorizer "> [4/${STP_D_DRV_X250_WIFI}] aptitude updating" $CLR_DPURPLE "y"
  aptitude update
  ctp-colorizer "> [5/${STP_D_DRV_X250_WIFI}] aptitude upgrading" $CLR_DPURPLE "y"
  aptitude upgrade
  ctp-colorizer "> [6/${STP_D_DRV_X250_WIFI}] Installing drivers" $CLR_DPURPLE "y"
  aptitude install firmware-iwlwifi
  ctp-colorizer "> [7/${STP_D_DRV_X250_WIFI}] Removing module from the kernel" $CLR_DPURPLE "y"
  modprobe -r iwlwifi
  ctp-colorizer "> [8/${STP_D_DRV_X250_WIFI}] Executing module" $CLR_DPURPLE "y"
  modprobe iwlwifi
}


########################################################################################################################
# Debian | Drivers | Lenovo X250: Install WiFi Adapter (AWUS036NHA)
function __d_drivers-lenovox250-wifiadapter()
{
  ctp-colorizer "> [1/${STP_D_DRV_X250_WIFIADAPTER}] Adding APT source ('$SRC_D_FIRMATHEROS')" $CLR_DPURPLE "y"
  echo ${SRC_D_FIRMATHEROS} >> /etc/apt/sources.list
  ctp-colorizer "> [2/${STP_D_DRV_X250_WIFIADAPTER}] apt-get updating" $CLR_DPURPLE "y"
  aptitude update
  ctp-colorizer "> [3/${STP_D_DRV_X250_WIFIADAPTER}] apt-get upgrading" $CLR_DPURPLE "y"
  aptitude upgrade
  ctp-colorizer "> [4/${STP_D_DRV_X250_WIFIADAPTER}] aptitude updating" $CLR_DPURPLE "y"
  aptitude update
  ctp-colorizer "> [5/${STP_D_DRV_X250_WIFIADAPTER}] aptitude upgrading" $CLR_DPURPLE "y"
  aptitude upgrade
  ctp-colorizer "> [6/${STP_D_DRV_X250_WIFIADAPTER}] Installing drivers" $CLR_DPURPLE "y"
  aptitude install firmware-atheros
}


########################################################################################################################
# Debian | Drivers | Lenovo X250: Install drivers
function d_drivers-lenovox250_install()
{
  # Audio drivers
  ctp-colorizer "[1/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 Audio drivers..." $CLR_LBLUE "y"
  __d_drivers-lenovox250-audio
  ctp-colorizer "[1/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 Audio drivers..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # WiFi drivers
  ctp-colorizer "[2/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 WiFi drivers..." $CLR_LBLUE "y"
  __d_drivers-lenovox250-wifi
  ctp-colorizer "[2/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 WiFi drivers..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # WiFi Adapter
  ctp-colorizer "[3/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 WiFi Adapter drivers..." $CLR_LBLUE "y"
  __d_drivers-lenovox250-wifiadapter
  ctp-colorizer "[3/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 WiFi Adapter drivers..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
}
