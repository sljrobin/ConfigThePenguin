#!/bin/bash
#
#        Filename: xmd-l_f-agnv.sh
#     Description: Functions to assign variables for different laptops
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-22 18:06:15
#        Modified: 2016-01-03 18:27:39
#
########################################################################################################################
# Assign variables | OS commands to get information
OS_ARCH=$(uname -a | grep -q ARCH; echo $?)      # OS Information for Arch Linux
OS_DEBIAN=$(uname -a | grep -q Debian; echo $?)  # OS Information for Debian 


########################################################################################################################
# Assign variables | Lenovo X250 | Audio
function __xmdl_agnv-lenovox250_audio()
{
  AUDIO_CARD_LENOVOX250="0"         # Audio card number
  AUDIO_CODEC_LENOVOX250="0"        # Audio codec number
  AUDIO_PINLINE_LENOVOX250=165      # Modified line when headphones were plugged
  HEADPHONES_OFF_LENOVOX250="0x40"  # Headphones not plugged
  HEADPHONES_ON_LENOVOX250="0x00"   # Headphones plugged

  AUDIO_CARD="$AUDIO_CARD_LENOVOX250"
  AUDIO_CODEC="$AUDIO_CODEC_LENOVOX250"
  AUDIO_PINLINE="$AUDIO_PINLINE_LENOVOX250"
  HEADPHONES_OFF="$HEADPHONES_OFF_LENOVOX250"
  HEADPHONES_ON="$HEADPHONES_ON_LENOVOX250"
}


################################################################################
# Assign variables | Lenovo X250 | Brightness
function __xmdl_agnv-lenovox250_brightness()
{
  BRIGHTNESS_CURRENT_LENOVOX250=$(cat /sys/class/backlight/intel_backlight/actual_brightness)  # Current brightness
  BRIGHTNESS_MAXIMAL_LENOVOX250=$(cat /sys/class/backlight/intel_backlight/max_brightness)     # Maximal brightness

  BRIGHTNESS_CURRENT="$BRIGHTNESS_CURRENT_LENOVOX250"
  BRIGHTNESS_MAXIMAL="$BRIGHTNESS_MAXIMAL_LENOVOX250"
}


################################################################################
# Assign variables | Lenovo X250 | Disk
function __xmdl_agnv-lenovox250_disk()
{
  DISK_LENOVOX250_ARCH="/dev/sda6"    # Disk (Arch partition)
  DISK_LENOVOX250_DEBIAN="/dev/sda8"  # Disk (Debian partition)

  # Arch
  if [ "${OS_ARCH}" == "0" ]; then 
    DISK="$DISK_LENOVOX250_ARCH"
  # Debian
  elif [ "${OS_DEBIAN}" == "0" ]; then 
    DISK="$DISK_LENOVOX250_DEBIAN"
  fi
}


################################################################################
# Assign variables | Lenovo X250 | Internet Devices
function __xmdl_agnv-lenovox250_inetdevices()
{
  DEVICE_ETHERNET_LENOVOX250_ARCH="enp0s25"  # Device Ethernet (Arch)
  DEVICE_ETHERNET_LENOVOX250_DEBIAN="eth0"   # Device Ethernet (Debian)
  DEVICE_WIFI_LENOVOX250_ARCH="wlp3s0"       # Device Wifi (Arch)
  DEVICE_WIFI_LENOVOX250_DEBIAN="wlan0"      # Device Wifi (Debian)

  # Arch
  if [ "${OS_ARCH}" == "0" ]; then 
    DEVICE_ETHERNET="$DEVICE_ETHERNET_LENOVOX250_ARCH"
    DEVICE_WIFI="$DEVICE_WIFI_LENOVOX250_ARCH"
  # Debian
  elif [ "${OS_DEBIAN}" == "0" ]; then 
    DEVICE_ETHERNET="$DEVICE_ETHERNET_LENOVOX250_DEBIAN"
    DEVICE_WIFI="$DEVICE_WIFI_LENOVOX250_DEBIAN"
  fi
}


################################################################################
# Assign variables | Lenovo X250 | Main
function __xmdl_agnv-lenovox250()
{
  __xmdl_agnv-lenovox250_audio
  __xmdl_agnv-lenovox250_brightness
  __xmdl_agnv-lenovox250_disk
  __xmdl_agnv-lenovox250_inetdevices
}


########################################################################################################################
# Assign variables | Asus 1015 | Brightness
function __xmdl_agnv-asus1015_brightness()
{
  BRIGHTNESS_CURRENT_ASUS1015=$(cat /sys/class/backlight/acpi_video0/actual_brightness)  # Current brightness
  BRIGHTNESS_MAXIMAL_ASUS1015=$(cat /sys/class/backlight/acpi_video0/max_brightness)     # Maximal brightness

  BRIGHTNESS_CURRENT="$BRIGHTNESS_CURRENT_ASUS1015"
  BRIGHTNESS_MAXIMAL="$BRIGHTNESS_MAXIMAL_ASUS1015"
}


################################################################################
# Assign variables | Asus 1015 | Internet Devices
function __xmdl_agnv-asus1015_inetdevices()
{
  DEVICE_ETHERNET_ASUS1015="enp2s0"  # Device Ethernet
  DEVICE_WIFI_ASUS1015="wlp1s0"      # Device Wifi

  DEVICE_ETHERNET="$DEVICE_ETHERNET_ASUS1015"
  DEVICE_WIFI="$DEVICE_WIFI_ASUS1015"
}


################################################################################
# Assign variables | Asus 1015 | Volume
function __xmdl_agnv-asus1015_volume()
{
  AUDIO_CARD_ASUS1015="1"         # Audio card number
  AUDIO_CODEC_ASUS1015="0"        # Audio codec number
  AUDIO_PINLINE_ASUS1015=133      # Modified line when headphones were plugged
  HEADPHONES_OFF_ASUS1015="0x40"  # Headphones not plugged
  HEADPHONES_ON_ASUS1015="0x00"   # Headphones plugged

  AUDIO_CARD="$AUDIO_CARD_ASUS1015"
  AUDIO_CODEC="$AUDIO_CODEC_ASUS1015"
  AUDIO_PINLINE="$AUDIO_PINLINE_ASUS1015"
  HEADPHONES_OFF="$HEADPHONES_OFF_ASUS1015"
  HEADPHONES_ON="$HEADPHONES_OFF_ASUS1015"
}


################################################################################
# Assign variables | Asus 1015 | Main
function __xmdl_agnv-asus1015()
{
  __xmdl_agnv-asus1015_brightness
  __xmdl_agnv-asus1015_inetdevices
  __xmdl_agnv-asus1015_volume
}


########################################################################################################################
# Assign variables | Use the Desktop Management Interface (DMI) to detect the current laptop and assign variables
function xmdl_agnv()
{
  PC_MANUFACTURER=$(cat /sys/devices/virtual/dmi/id/sys_vendor)  # Manufacturer
  PC_MANUFACTURER_ASUS="ASUSTeK Computer INC."                   # Manufacturer: Asus
  PC_MANUFACTURER_LENOVO="LENOVO"                                # Manufacturer: Lenovo
  PC_PRODUCT=$(cat /sys/devices/virtual/dmi/id/product_name)     # Product
  PC_PRODUCT_ASUS1015="1015B"                                    # Product: Asus 1015B
  PC_PRODUCT_LENOVOX250="20CMCTO1WW"                             # Product: Lenovo X250

  # Lenovo
  if [ "$PC_MANUFACTURER" == "$PC_MANUFACTURER_LENOVO" ]; then
    # X250
    if [ "$PC_PRODUCT" == "$PC_PRODUCT_LENOVOX250" ]; then
      __xmdl_agnv-lenovox250
    # Unknown
    else
      echo "ERROR: Unknown $PC_MANUFACTURER_LENOVO product!"
    fi
  # Asus
  elif [ "$PC_MANUFACTURER" == "$PC_MANUFACTURER_ASUS" ]; then
    # 1015B
    if [ "$PC_PRODUCT" == "$PC_PRODUCT_LENOVOX250" ]; then
      __xmdl_agnv-asus1015
    # Unknown
    else
      echo "ERROR: Unknown $PC_MANUFACTURER_ASUS product!"
    fi
  # Unknown Manufacturer
  else
    echo "ERROR: Unknown Manufacturer"
  fi
}
