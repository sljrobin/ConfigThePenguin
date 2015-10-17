#!/bin/bash

source _core.sh


########################################################################################################################
# Install WiFi Adapter (AWUS036NHA)
function debian_install_drivers_lenovox250_wifiadapter()
{
  colorize "Installing Lenovo ThinkPad X250 WiFi Adapter drivers..." $CLR_LPURPLE "y"
  colorize "Lenovo ThinkPad X250 WiFi Adapter drivers [1/${STP_DRV_X250_WIFIADAPTER}] Installing drivers" $CLR_LBLUE "y"
  aptitude install firmware-atheros
  colorize "Installing Lenovo ThinkPad X250 WiFi Adapter drivers... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Install WiFi drivers
# http://linux.die.net/man/8/modprobe
# https://wiki.debian.org/iwlwifi
function debian_install_drivers_lenovox250_wifi()
{
  colorize "Installing Lenovo ThinkPad X250 WiFi drivers..." $CLR_LPURPLE "y"
  colorize "Lenovo ThinkPad X250 WiFi drivers [1/${STP_DRV_X250_WIFI}] Installing drivers" $CLR_LBLUE "y"
  aptitude install firmware-iwlwifi
  colorize "Lenovo ThinkPad X250 WiFi drivers [2/${STP_DRV_X250_WIFI}] Removing module from the kernel" $CLR_LBLUE "y"
  modprobe -r iwlwifi
  colorize "Lenovo ThinkPad X250 Wifi drivers [3/${STP_DRV_X250_WIFI}] Executing module" $CLR_LBLUE "y"
  modprobe iwlwifi
  colorize "Installing Lenovo ThinkPad X250 WiFi drivers... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Install Audio drivers
function debian_install_drivers_lenovox250_audio()
{
  colorize "Installing Lenovo ThinkPad X250 Audio drivers..." $CLR_LPURPLE "y"
  colorize "Lenovo ThinkPad X250 Audio drivers [1/${STP_DRV_X250_AUDIO}] Changing the audio card's order" $CLR_LBLUE "y"
  echo "options snd_hda_intel index=1 model=thinkpad" >> /etc/modprobe.d/sound.conf
  colorize "A reboot is necessary" $CLR_LORANGE "y"
  colorize "Installing Lenovo ThinkPad X250 Audio drivers... [DONE]" $CLR_LGREEN "y"
}
