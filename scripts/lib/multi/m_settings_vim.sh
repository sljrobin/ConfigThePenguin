#!/bin/bash

########################################################################################################################
# Multi | Settings | vim: Check if the '.vimrc' file exists
function __m_settings_vim_checkrc()
{
  if [ ! -f "$DIR_VIMRC" ]; then
    colorize "> The file '$DIR_VIMRC' does not exist. Need to create a symlink for '$DIR_VIMRC' or copy it." $CLR_DRED "y"
    exit 1
  fi
}


########################################################################################################################
# Multi | Settings | vim: Create vim directories
function __m_settings_vim_createdirs()
{
  # Main directory
  if [ -d "$DIR_VIM_MAIN" ]; then
    colorize "> [1/${STP_M_SET_VIM_CREATEDIRS}] The directory '$DIR_VIM_MAIN/' already exists." $CLR_DORANGE "y"
  else
    colorize "> [1/${STP_M_SET_VIM_CREATEDIRS}] Creating '$DIR_VIM_MAIN/'" $CLR_DPURPLE "y"
    mkdir "$DIR_VIM_MAIN" 
  fi
  # Bundle directory
  if [ -d "$DIR_VIM_BUNDLE" ]; then
    colorize "> [2/${STP_M_SET_VIM_CREATEDIRS}] The directory '$DIR_VIM_BUNDLE/' already exists." $CLR_DORANGE "y"
  else
    colorize "> [2/${STP_M_SET_VIM_CREATEDIRS}] Creating '$DIR_VIM_BUNDLE/'" $CLR_DPURPLE "y"
    mkdir "$DIR_VIM_BUNDLE" 
  fi
  # Spell directory
  if [ -d "$DIR_VIM_SPELL" ]; then
    colorize "> [3/${STP_M_SET_VIM_CREATEDIRS}] The directory '$DIR_VIM_SPELL/' already exists." $CLR_DORANGE "y"
  else
    colorize "> [3/${STP_M_SET_VIM_CREATEDIRS}] Creating '$DIR_VIM_SPELL/'" $CLR_DPURPLE "y"
    mkdir "$DIR_VIM_SPELL" 
  fi
}


########################################################################################################################
# Multi | Settings | vim: Install plugins
function __m_settings_vim_installplugins()
{
  # Vundle
  colorize "> [1/${STP_M_SET_VIM_PLUGINS}] Installing Vundle" $CLR_DPURPLE "y"
  if [ -d "$DIR_VIM_BUNDLE/Vundle.vim" ]; then
    colorize "> The directory '$DIR_VIM_BUNDLE/Vundle.vim/' already exists. No need to complete the installation of Vundle." $CLR_DORANGE "y"
  else
    git clone https://github.com/VundleVim/Vundle.vim.git "$DIR_VIM_BUNDLE/Vundle.vim"
  fi
  # Plugins
  colorize "> [2/${STP_M_SET_VIM_PLUGINS}] Installing Plugins from '$DIR_VIMRC'" $CLR_DPURPLE "y"
  vim +PluginInstall +qall
  # YouCompleteMe
  colorize "> [3/${STP_M_SET_VIM_PLUGINS}] Finishing installation of 'YouCompleteMe'" $CLR_DPURPLE "y"
  cd "$DIR_VIM_BUNDLE/YouCompleteMe"
  python install.py
}


########################################################################################################################
# Multi | Settings | vim: Install vim
function m_settings_vim()
{
  # Check .vimrc
  colorize "[1/${STP_M_SET_VIM}] Checking if the file '$DIR_VIMRC' exists..." $CLR_LBLUE "y"
  __m_settings_vim_checkrc
  colorize "[1/${STP_M_SET_VIM}] Checking if the file '$DIR_VIMRC' exists..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
  # Create directories
  colorize "[2/${STP_M_SET_VIM}] Creating directories..." $CLR_LBLUE "y"
  __m_settings_vim_createdirs
  colorize "[2/${STP_M_SET_VIM}] Creating directories..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
  # Install plugins
  colorize "[3/${STP_M_SET_VIM}] Installing plugins..." $CLR_LBLUE "y"
  __m_settings_vim_installplugins
  colorize "[3/${STP_M_SET_VIM}] Installing plugins..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
}
