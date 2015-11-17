#!/bin/bash

########################################################################################################################
# Initialization
#    * Adding APT sources
#    * Updating and upgrading with apt-get
#    * Installing aptitude
#    * Updating and upgrading with aptitude
function debian_init()
{
  SRC_APT_NONFREE_1="deb http://httpredir.debian.org/debian/ jessie main contrib non-free"
  SRC_APT_NONFREE_2="deb http://http.debian.net/debian/ jessie main contrib non-free"

  colorize "Initialization [1/${STP_D_PKG_INITIALIZATION}] Adding APT source ('$SRC_APT_NONFREE_1')" $CLR_LBLUE "y"
  echo ${SRC_APT_NONFREE_1} >> /etc/apt/sources.list
  colorize "Initialization [2/${STP_D_PKG_INITIALIZATION}] Adding APT source ('$SRC_APT_NONFREE_2')" $CLR_LBLUE "y"
  echo ${SRC_APT_NONFREE_2} >> /etc/apt/sources.list
  colorize "Initialization [3/${STP_D_PKG_INITIALIZATION}] Updating (apt-get)" $CLR_LBLUE "y"
  apt-get update
  colorize "Initialization [4/${STP_D_PKG_INITIALIZATION}] Upgrading (apt-get)" $CLR_LBLUE "y"
  apt-get upgrade
  colorize "Initialization [5/${STP_D_PKG_INITIALIZATION}] Installing aptitude" $CLR_LBLUE "y"
  apt-get install aptitude
  colorize "Initialization [6/${STP_D_PKG_INITIALIZATION}] Updating (aptitude)" $CLR_LBLUE "y"
  aptitude update
  colorize "Initialization [7/${STP_D_PKG_INITIALIZATION}] Upgrading (aptitude)" $CLR_LBLUE "y"
  aptitude upgrade
}
