#!/bin/bash

## Paths
PATH_USER=$HOME
PATH_XMONAD="$PATH_USER/.xmonad"
PATH_DATA="$PATH_XMONAD/data"
PATH_ICONS="$PATH_DATA/icons"

## Commands
CMD_OSINFO_ARCH=$(uname -a | grep -q ARCH; echo $?)
CMD_OSINFO_DEBIAN=$(uname -a | grep -q Debian; echo $?)

## Colors
COLOR_DBLUE="#3465A4"
COLOR_DGREEN="#4E9A06"
COLOR_DGREY="#2E3436"
COLOR_DMAGENTA="#75507B"
COLOR_DORANGE="#CE5C00"
COLOR_DRED="#A40000"
COLOR_DWHITE="#BABDB9"
COLOR_DYELLOW="#C4A000"

#COLOR_LBLUE="#729FCF"
#COLOR_LGREEN="#8AE234"
#COLOR_LGREY="#555753"
#COLOR_LMAGENTA="#AD7FA8"
#COLOR_LORANGE="#FCAF3E"
#COLOR_LRED="#EF2929"
#COLOR_LWHITE="#EEEEEC"
#COLOR_LYELLOW="#FCE94F"

COLOR_LBLUE="#7CAFC2"
COLOR_LGREEN="#A1B56C"
COLOR_LGREY="#585858"
COLOR_LMAGENTA="#BA8BAF"
COLOR_LORANGE="#DC9656"
COLOR_LRED="#AB4642"
COLOR_LWHITE="#F8F8F8"
COLOR_LYELLOW="#FCE94F"

## Icons
ICON_AC="ac_01"
ICON_BATLVL_LOW="bat_low_01"
ICON_BATLVL_EMPTY="bat_empty_01"
ICON_BATLVL_FULL="bat_full_01"
ICON_BLUETOOTH="bluetooth"
ICON_ETHERNET="net_wired"
ICON_HDPHONES="phones"
ICON_USB="usb_02"
ICON_VOLLVL_HIGH="spkr_03"
ICON_VOLLVL_MEDIUM="spkr_01"
ICON_VOLLVL_NORMAL="spkr_02"
ICON_WIFI="wifi_02"



# Assign variables for scripts for Lenovo ThinkPad X250
function assignvar_lenovox250()
{
  # Brightness
  BRIGHTNESS_CURRENT_LENOVOX250=$(cat /sys/class/backlight/intel_backlight/actual_brightness)  # Current brightness
  BRIGHTNESS_MAXIMAL_LENOVOX250=$(cat /sys/class/backlight/intel_backlight/max_brightness)     # Maximal brightness
  BRIGHTNESS_CURRENT="$BRIGHTNESS_CURRENT_LENOVOX250"                                          # Assign: Current brightness
  BRIGHTNESS_MAXIMAL="$BRIGHTNESS_MAXIMAL_LENOVOX250"                                          # Assign: Maximal brightness

  # Internet Devices
  DEVICE_ETHERNET_LENOVOX250_ARCH="enp0s25"                                                    # Device Ethernet (Arch)
  DEVICE_ETHERNET_LENOVOX250_DEBIAN="eth0"                                                     # Device Ethernet (Debian)
  DEVICE_WIFI_LENOVOX250_ARCH="wlp3s0"                                                         # Device Wifi (Arch)
  DEVICE_WIFI_LENOVOX250_DEBIAN="wlan0"                                                        # Device Wifi (Debian)
  # Internet Devices: assigning
  if [ "${CMD_OSINFO_ARCH}" == "0" ]; then 
    DEVICE_ETHERNET="$DEVICE_ETHERNET_LENOVOX250_ARCH"                                         # Assign: Device Ethernet (Arch)
    DEVICE_WIFI="$DEVICE_WIFI_LENOVOX250_ARCH"                                                 # Assign: Device Wifi (Arch)
  elif [ "${CMD_OSINFO_DEBIAN}" == "0" ]; then 
    DEVICE_ETHERNET="$DEVICE_ETHERNET_LENOVOX250_DEBIAN"                                       # Assign: Device Ethernet (Debian)
    DEVICE_WIFI="$DEVICE_WIFI_LENOVOX250_DEBIAN"                                               # Assign: Device Wifi (Debian)
  fi

  # Disk
  DISK_LENOVOX250_ARCH=""
  DISK_LENOVOX250_DEBIAN="/dev/sda8"
  # Disk: assigning
  if [ "${CMD_OSINFO_ARCH}" == "0" ]; then 
    DISK="$DISK_LENOVOX250_ARCH"                                         # Assign: Disk (Arch)
  elif [ "${CMD_OSINFO_DEBIAN}" == "0" ]; then 
    DISK="$DISK_LENOVOX250_DEBIAN"                                       # Assign: Disk (Debian)
  fi


  # Volume
  AUDIO_CARD_LENOVOX250="0"                                                                    # Audio card number
  AUDIO_CODEC_LENOVOX250="0"                                                                   # Audio codec number
  AUDIO_PINLINE_LENOVOX250=165                                                                 # Modified line when headphones were plugged
  HEADPHONES_OFF_LENOVOX250="0x40"                                                             # Headphones not plugged
  HEADPHONES_ON_LENOVOX250="0x00"                                                              # Headphones plugged
  AUDIO_CARD="$AUDIO_CARD_LENOVOX250"                                                          # Audio card number
  AUDIO_CODEC="$AUDIO_CODEC_LENOVOX250"                                                        # Assign: Audio codec number
  AUDIO_PINLINE="$AUDIO_PINLINE_LENOVOX250"                                                    # Assign: Modified line when headphones were plugged
  HEADPHONES_OFF="$HEADPHONES_OFF_LENOVOX250"                                                  # Assign: Headphones not plugged
  HEADPHONES_ON="$HEADPHONES_ON_LENOVOX250"                                                    # Assign: Headphones plugged
}


# Assign variables for scripts for Asus 1015
function assignvar_asus1015()
{
  # Brightness
  BRIGHTNESS_CURRENT_ASUS1015=$(cat /sys/class/backlight/acpi_video0/actual_brightness)        # Current brightness
  BRIGHTNESS_MAXIMAL_ASUS1015=$(cat /sys/class/backlight/acpi_video0/max_brightness)           # Maximal brightness
  BRIGHTNESS_CURRENT="$BRIGHTNESS_CURRENT_ASUS1015"                                            # Assign: Current brightness
  BRIGHTNESS_MAXIMAL="$BRIGHTNESS_MAXIMAL_ASUS1015"                                            # Assign: Maximal brightness

  # Internet Devices
  DEVICE_ETHERNET_ASUS1015="enp2s0"                                                            # Device Ethernet
  DEVICE_WIFI_ASUS1015="wlp1s0"                                                                # Device Wifi
  DEVICE_ETHERNET="$DEVICE_ETHERNET_ASUS1015"                                                  # Assign: Device Ethernet
  DEVICE_WIFI="$DEVICE_WIFI_ASUS1015"                                                          # Assign: Device Wifi

  # Volume
  AUDIO_CARD_ASUS1015="1"                                                                      # Audio card number
  AUDIO_CODEC_ASUS1015="0"                                                                     # Audio codec number
  AUDIO_PINLINE_ASUS1015=133                                                                   # Modified line when headphones were plugged
  HEADPHONES_OFF_ASUS1015="0x40"                                                               # Headphones not plugged
  HEADPHONES_ON_ASUS1015="0x00"                                                                # Headphones plugged
  AUDIO_CARD="$AUDIO_CARD_ASUS1015"                                                            # Assign: Audio card number
  AUDIO_CODEC="$AUDIO_CODEC_ASUS1015"                                                          # Assign: Audio codec number
  AUDIO_PINLINE="$AUDIO_PINLINE_ASUS1015"                                                      # Assign: Modified line when headphones were plugged
  HEADPHONES_OFF="$HEADPHONES_OFF_ASUS1015"                                                    # Assign: Headphones not plugged
  HEADPHONES_ON="$HEADPHONES_OFF_ASUS1015"                                                     # Assign: Headphones plugged
}


# Get the PC's Manufacturer and PC's Product from the Desktop Management Interface
function get_dmi()
{
  # Lenovo ThinkPad X250
  PC_MANUFACTURER_LENOVO="LENOVO"
  PC_PRODUCT_LENOVOX250="20CMCTO1WW"

  # Asus 1015B
  PC_MANUFACTURER_ASUS="ASUSTeK Computer INC."
  PC_PRODUCT_ASUS1015="1015B"


  PC_MANUFACTURER=$(cat /sys/devices/virtual/dmi/id/sys_vendor)
  PC_PRODUCT=$(cat /sys/devices/virtual/dmi/id/product_name)

  # Lenovo
  if [ "$PC_MANUFACTURER" == "$PC_MANUFACTURER_LENOVO" ]; then
    # ThinkPad X250
    if [ "$PC_PRODUCT" == "$PC_PRODUCT_LENOVOX250" ]; then
      assignvar_lenovox250
    # Unknown
    else
      echo "ERROR: Unknown $PC_MANUFACTURER_LENOVO product!"
    fi

  # Asus
  elif [ "$PC_MANUFACTURER" == "$PC_MANUFACTURER_ASUS" ]; then
    # 1015B
    if [ "$PC_PRODUCT" == "$PC_PRODUCT_LENOVOX250" ]; then
      assignvar_asus1015
    # Unknown
    else
      echo "ERROR: Unknown $PC_MANUFACTURER_ASUS product!"
    fi

  # Unknown Manufacturer
  else
    echo "ERROR: Unknown Manufacturer"
  fi
}


# Show an icon
#   $1: the icon to show
function print_ic()
{
  echo -n "^i($PATH_ICONS/$1.xbm) "
}


# Use a foreground
#   $1: the foreground color to use
#   $2: the text to print
function color_fg()
{
  echo -n "^fg($1)$2^fg()"
}


# Generate an error message
function gen_error()
{
  color_fg $COLOR_LRED "ERROR!"
}



get_dmi
