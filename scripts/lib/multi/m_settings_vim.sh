#!/bin/bash

########################################################################################################################
# Multi | Settings | vim: Check if the '.vimrc' file exists
function __m_settings-vim_checkrc()
{
  if [ ! -f "$DIR_VIMRC" ]; then
    ctp-colorizer "> The file '$DIR_VIMRC' does not exist. Need to create a symlink for '$DIR_VIMRC' or copy it." $CLR_DRED "y"
    exit 1
  fi
}


########################################################################################################################
# Multi | Settings | vim: Install plugins
function __m_settings-vim_installplugins()
{
  # Vundle
  ctp-colorizer "> [1/${STP_M_SET_VIM_PLUGINS}] Installing Vundle" $CLR_DPURPLE "y"
  if [ -d "$DIR_VIM_BUNDLE/Vundle.vim" ]; then
    ctp-colorizer "> The directory '$DIR_VIM_BUNDLE/Vundle.vim/' already exists. No need to complete the installation of Vundle." $CLR_DORANGE "y"
  else
    git clone https://github.com/VundleVim/Vundle.vim.git "$DIR_VIM_BUNDLE/Vundle.vim"
  fi
  # Plugins
  ctp-colorizer "> [2/${STP_M_SET_VIM_PLUGINS}] Installing Plugins from '$DIR_VIMRC'" $CLR_DPURPLE "y"
  vim +PluginInstall +qall
  # YouCompleteMe
  ctp-colorizer "> [3/${STP_M_SET_VIM_PLUGINS}] Finishing installation of 'YouCompleteMe'" $CLR_DPURPLE "y"
  cd "$DIR_VIM_BUNDLE/YouCompleteMe"
  python install.py
  return $?
}


########################################################################################################################
# Multi | Settings | vim: Set vim
function m_settings-vim_set()
{
  # Check .vimrc
  ctp-colorizer "[1/${STP_M_SET_VIM}] Checking if the file '$DIR_VIMRC' exists..." $CLR_LBLUE "y"
  __m_settings-vim_checkrc
  ctp-colorizer "[1/${STP_M_SET_VIM}] Checking if the file '$DIR_VIMRC' exists..." $CLR_LBLUE "n"
  ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  # Install plugins
  ctp-colorizer "[2/${STP_M_SET_VIM}] Installing plugins..." $CLR_LBLUE "y"
  __m_settings-vim_installplugins
# Checking exit status
  exit_status=$?
  ctp-colorizer "[2/${STP_M_SET_VIM}] Installing plugins..." $CLR_LBLUE "n"
  # Printing exit status
  if [ $exit_status = 0 ]; then
    ctp-colorizer " [DONE]" $CLR_LGREEN "y"
  else
    ctp-colorizer " [FAIL]" $CLR_LRED "y"
  fi
}
