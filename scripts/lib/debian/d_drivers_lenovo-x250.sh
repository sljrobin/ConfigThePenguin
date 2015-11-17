#!/bin/bash

########################################################################################################################
# Debian | Drivers | Lenovo X250: Install Audio drivers
function __d_drivers_lenovox250_audio()
{
  colorize "> [1/${STP_D_DRV_X250_AUDIO}] Changing the audio card's order" $CLR_DPURPLE "y"
  echo "options snd_hda_intel index=1 model=thinkpad" >> /etc/modprobe.d/sound.conf
  colorize "> A reboot is necessary" $CLR_DORANGE "y"
}


########################################################################################################################
# Debian | Drivers | Lenovo X250: Install WiFi drivers
function __d_drivers_lenovox250_wifi()
{
  colorize "> [1/${STP_D_DRV_X250_WIFI}] Adding APT source ('$SRC_D_IWLWIFI')" $CLR_DPURPLE "y"
  echo ${SRC_D_IWLWIFI} >> /etc/apt/sources.list
  colorize "> [2/${STP_D_DRV_X250_WIFI}] apt-get updating" $CLR_DPURPLE "y"
  aptitude update
  colorize "> [3/${STP_D_DRV_X250_WIFI}] apt-get upgrading" $CLR_DPURPLE "y"
  aptitude upgrade
  colorize "> [4/${STP_D_DRV_X250_WIFI}] aptitude updating" $CLR_DPURPLE "y"
  aptitude update
  colorize "> [5/${STP_D_DRV_X250_WIFI}] aptitude upgrading" $CLR_DPURPLE "y"
  aptitude upgrade
  colorize "> [6/${STP_D_DRV_X250_WIFI}] Installing drivers" $CLR_DPURPLE "y"
  aptitude install firmware-iwlwifi
  colorize "> [7/${STP_D_DRV_X250_WIFI}] Removing module from the kernel" $CLR_DPURPLE "y"
  modprobe -r iwlwifi
  colorize "> [8/${STP_D_DRV_X250_WIFI}] Executing module" $CLR_DPURPLE "y"
  modprobe iwlwifi
}


########################################################################################################################
# Debian | Drivers | Lenovo X250: Install WiFi Adapter (AWUS036NHA)
function __d_drivers_lenovox250_wifiadapter()
{
  colorize "> [1/${STP_D_DRV_X250_WIFIADAPTER}] Adding APT source ('$SRC_D_FIRMATHEROS')" $CLR_DPURPLE "y"
  echo ${SRC_D_FIRMATHEROS} >> /etc/apt/sources.list
  colorize "> [2/${STP_D_DRV_X250_WIFIADAPTER}] apt-get updating" $CLR_DPURPLE "y"
  aptitude update
  colorize "> [3/${STP_D_DRV_X250_WIFIADAPTER}] apt-get upgrading" $CLR_DPURPLE "y"
  aptitude upgrade
  colorize "> [4/${STP_D_DRV_X250_WIFIADAPTER}] aptitude updating" $CLR_DPURPLE "y"
  aptitude update
  colorize "> [5/${STP_D_DRV_X250_WIFIADAPTER}] aptitude upgrading" $CLR_DPURPLE "y"
  aptitude upgrade
  colorize "> [6/${STP_D_DRV_X250_WIFIADAPTER}] Installing drivers" $CLR_DPURPLE "y"
  aptitude install firmware-atheros
}


########################################################################################################################
# Debian | Drivers | Lenovo X250: Install drivers
function d_drivers_lenovox250()
{
  # Audio drivers
  colorize "[1/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 Audio drivers..." $CLR_LBLUE "y"
  __d_drivers_lenovox250_audio
  colorize "[1/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 Audio drivers..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
  # WiFi drivers
  colorize "[2/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 WiFi drivers..." $CLR_LBLUE "y"
  __d_drivers_lenovox250_wifi
  colorize "[2/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 WiFi drivers..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
  # WiFi Adapter
  colorize "[3/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 WiFi Adapter drivers..." $CLR_LBLUE "y"
  __d_drivers_lenovox250_wifiadapter
  colorize "[3/${STP_D_DRV_X250}] Installing Lenovo ThinkPad X250 WiFi Adapter drivers..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
}
