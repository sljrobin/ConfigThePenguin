#!/bin/bash

########################################################################################################################
# Step 1 d_init_root
# * Check if the user is root
# * apt-get update, upgrade
# * apt-get install aptitude
# * aptitude update upgrade
# * aptitude install visudo
# * aptitude install git
# * remove the script by asking the user (https://stackoverflow.com/questions/8981164/self-deleting-shell-script)
# Step 2
# * ask for the username
# * add username into /etc/sudoers (sudo adduser <username> sudo)
# * mkdir projects, cd project. git clone ctp, go to the script 
# * remove the script by asking the user





DIR_PROJECTS="$HOME/Thatisthetest"
function debian_init()
{
#  apt-get update
#  apt-get upgrade
#  apt-get install aptitude
#  aptitude update
#  aptitude upgrade
#  aptitude install git
#  aptitude install visudo
  su "sljrobin"
  cd
  pwd
  mkdir "$DIR_PROJECTS"
  cd $DIR_PROJECTS
  git clone git://github.com/sljrobin/ConfigThePenguin
  cd "$DIR_PROJECTS/ConfigThePenguin/scripts"
}
