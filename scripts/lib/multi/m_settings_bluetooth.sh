#!/bin/bash

########################################################################################################################
# Multi | Settings | Bluetooth: Adding setting lines
#   $1: Bluetooth's setting line
function __m_settings-bluetooth_addlines()
{
  # Find line number of the last occurence of the 'exit 0' command
  local LINE_LASTCMDEXIT=$(awk '/exit 0/{ print NR; }' $DIR_RCLOCAL | tail -n 1)
  # Add the Bluetooth's setting in the previous line
  sudo sed -i "$LINE_LASTCMDEXIT s/^/# Disable permanently Bluetooth\n$(echo $1)\n/" $DIR_RCLOCAL
}


########################################################################################################################
# Multi | Settings | Bluetooth: Check if setting lines already exist
#   $1: Bluetooth's setting line
function __m_settings-bluetooth_checklines()
{
  # The file does not exist
  if [ ! -f "$DIR_RCLOCAL" ]; then
    ctp-colorizer "> The file '$DIR_RCLOCAL' does not exist. Need to create it" $CLR_DORANGE "y"
    return 1
  # The file exists
  else
    # If lines are found
    if grep -Fxq "$1" "$DIR_RCLOCAL"; then
      ctp-colorizer "> Line settings are already set, no need to continue" $CLR_DORANGE "y"
      return 1
    # If lines are not found or errors
    else
      return 0
    fi
  fi
}


########################################################################################################################
# Multi | Settings | Bluetooth: Check root
function __m_settings-bluetooth_checkroot()
{
  # If the user is not root
  if [ "$EUID" -ne 0 ]; then
    ctp-colorizer "> The current user is not root, user's password can be required" $CLR_DORANGE "y"
  fi 
}


########################################################################################################################
# Multi | Settings | Bluetooth: Set Bluetooth
function m_settings-bluetooth_set()
{
  local BT_CMDLINE="rfkill bluetooth"  # Setting line to disable permanently Bluetooth

  # Checking if line settings already exist
  ctp-colorizer "[1/$STP_M_SET_BLUETOOTH] Checking if setting lines already exist..." $CLR_LBLUE "y"
  __m_settings-bluetooth_checklines "$BT_CMDLINE"
  # Checking existence of the lines
  checklines_status=$?
  ctp-colorizer "[1/$STP_M_SET_BLUETOOTH] Checking if setting lines already exist..." $CLR_LBLUE "n"
  # Print status of the existence of the lines
  if [ $checklines_status = 0 ]; then
    ctp-colorizer " [DONE]" $CLR_LGREEN "y"
    # Checking user's ID
    ctp-colorizer "[2/$STP_M_SET_BLUETOOTH] Checking user's ID..." $CLR_LBLUE "y"
    __m_settings-bluetooth_checkroot
    ctp-colorizer "[2/$STP_M_SET_BLUETOOTH] Checking user's ID..." $CLR_LBLUE "n"
    ctp-colorizer " [DONE]" $CLR_LGREEN "y"
    # Add the setting lines
    ctp-colorizer "[3/$STP_M_SET_BLUETOOTH] Adding Bluetooth setting lines..." $CLR_LBLUE "y"
    __m_settings-bluetooth_addlines "$BT_CMDLINE"
    # Checking adding of the lines
    setlines_status=$?
    ctp-colorizer "[3/$STP_M_SET_BLUETOOTH] Adding Bluetooth setting lines..." $CLR_LBLUE "n"
    # Print status of the adding of the lines
    if [ $setlines_status = 0 ]; then
      ctp-colorizer " [DONE]" $CLR_LGREEN "y"
    else
      ctp-colorizer " [FAIL]" $CLR_LRED "y"
    fi
  else
    ctp-colorizer " [DONE]" $CLR_LGREEN "y"
    return 0
  fi
}
