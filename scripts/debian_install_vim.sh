#!/bin/bash

source _core.sh


########################################################################################################################
# base16
function install_vim_base16()
{
  colorize "Installing base16..." $CLR_LPURPLE "y"
  colorize "base16 [1/${STP_VIM_BASE16}] Going to 'bundle/'" $CLR_LBLUE "y"
  cd ~/.vim/bundle
  colorize "base16 [2/${STP_VIM_BASE16}] Downloading the repository from GitHub" $CLR_LBLUE "y"
  git clone https://github.com/chriskempson/base16-vim.git
  colorize "Installing base16... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Command-T
function install_vim_commandt()
{
  colorize "Installing Command-T..." $CLR_LPURPLE "y"
  colorize "Command-T [1/${STP_VIM_COMMANDT}] Going to 'bundle/'" $CLR_LBLUE "y"
  cd ~/.vim/bundle
  colorize "NERD Tree [2/${STP_VIM_COMMANDT}] Downloading the repository from GitHub" $CLR_LBLUE "y"
  git clone git://github.com/wincent/Command-T
  colorize "Command-T [3/${STP_VIM_COMMANDT}] Going to main folder 'command-t/'" $CLR_LBLUE "y"
  cd Command-T/ruby/command-t/
  colorize "Command-T [4/${STP_VIM_COMMANDT}] Executing Ruby script" $CLR_LBLUE "y"
  ruby extconf.rb
  colorize "Command-T [5/${STP_VIM_COMMANDT}] Compiling" $CLR_LBLUE "y"
  make
  colorize "Installing Command-T... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# delimitMate
function install_vim_delimitmate()
{
  colorize "Installing delimitMate..." $CLR_LPURPLE "y"
  colorize "delimitMate [1/${STP_VIM_DELIMITMATE}] Going to 'bundle/'" $CLR_LBLUE "y"
  cd ~/.vim/bundle
  colorize "delimitMate [2/${STP_VIM_DELIMITMATE}] Downloading the repository from GitHub" $CLR_LBLUE "y"
  git clone git://github.com/Raimondi/delimitMate
  colorize "Installing delimitMate... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# indentLine
function install_vim_indentline()
{
  colorize "Installing indentLine..." $CLR_LPURPLE "y"
  colorize "indentLine [1/${STP_VIM_INDENTLINE}] Going to 'bundle/'" $CLR_LBLUE "y"
  cd ~/.vim/bundle
  colorize "indentLine [2/${STP_VIM_INDENTLINE}] Downloading the repository from GitHub" $CLR_LBLUE "y"
  git clone git://github.com/Yggdroot/indentLine
  colorize "Installing indentLine... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Multiple Cursors
function install_vim_multiplecursors()
{
  colorize "Installing vim-multiple-cursors..." $CLR_LPURPLE "y"
  colorize "vim-multiple-cursors [1/${STP_VIM_MULTIPLECURSORS}] Going to 'bundle/'" $CLR_LBLUE "y"
  cd ~/.vim/bundle
  colorize "vim-multiple-cursors [2/${STP_VIM_MULTIPLECURSORS}] Downloading the repository from GitHub" $CLR_LBLUE "y"
  git clone git://github.com/terryma/vim-multiple-cursors
  colorize "Installing vim-multiple-cursors... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# NERD Tree
function install_vim_nerdtree()
{
  colorize "Installing NERD Tree..." $CLR_LPURPLE "y"
  colorize "NERD Tree [1/${STP_VIM_NERDTREE}] Going to 'bundle/'" $CLR_LBLUE "y"
  cd ~/.vim/bundle
  colorize "NERD Tree [2/${STP_VIM_NERDTREE}] Downloading the repository from GitHub" $CLR_LBLUE "y"
  git clone git://github.com/scrooloose/nerdtree.git
  colorize "Installing NERD Tree... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Pathogen
function install_vim_pathogen()
{
  colorize "Installing Pathogen..." $CLR_LPURPLE "y"
  colorize "Pathogen [1/${STP_VIM_PATHOGEN}] Creating directories ('autoload/')" $CLR_LBLUE "y"
  mkdir -p ~/.vim/autoload
  colorize "Pathogen [2/${STP_VIM_PATHOGEN}] Creating directories ('bundle/')" $CLR_LBLUE "y"
  mkdir -p ~/.vim/bundle
  colorize "Pathogen [3/${STP_VIM_PATHOGEN}] Going to 'autoload/'" $CLR_LBLUE "y"
  cd ~/.vim/autoload
  colorize "Pathogen [4/${STP_VIM_PATHOGEN}] Copying Pathogen from GitHub to 'pathogen.vim'" $CLR_LBLUE "y"
  curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > pathogen.vim
  colorize "Installing Pathogen... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Surround
function install_vim_surround()
{
  colorize "Installing Surround..." $CLR_LPURPLE "y"
  colorize "Surround [1/${STP_VIM_SURROUND}] Going to 'bundle/'" $CLR_LBLUE "y"
  cd ~/.vim/bundle
  colorize "Surround [2/${STP_VIM_SURROUND}] Downloading the repository from GitHub" $CLR_LBLUE "y"
  git clone git://github.com/tpope/vim-surround
  colorize "Installing Surround... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Taglist
function install_vim_taglist()
{
  TAGLIST_FOLDER="taglist.zip"    # Name of the downloaded file

  colorize "Installing Taglist..." $CLR_LPURPLE "y"
  colorize "Taglist [1/${STP_VIM_TAGLIST}] Going to '.vim/'" $CLR_LBLUE "y"
  cd ~/.vim/
  colorize "Taglist [2/${STP_VIM_TAGLIST}] Downloading the repository from SourceForge" $CLR_LBLUE "y"
  wget -O ${TAGLIST_FOLDER} http://sourceforge.net/projects/vim-taglist/files/latest/download?source=files
  colorize "Taglist [3/${STP_VIM_TAGLIST}] Extracting main .zip file" $CLR_LBLUE "y"
  unzip ${TAGLIST_FOLDER}
  colorize "Taglist [4/${STP_VIM_TAGLIST}] Removing main .zip file" $CLR_LBLUE "y"
  rm ${TAGLIST_FOLDER}
  colorize "Installing Taglist... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# YouCompleteMe
function install_vim_youcompleteme()
{
  colorize "Installing YouCompleteMe..." $CLR_LPURPLE "y"
  colorize "YouCompleteMe [1/${STP_VIM_YOUCOMPLETEME}] Going to 'bundle/'" $CLR_LBLUE "y"
  cd ~/.vim/bundle
  colorize "YouCompleteMe [2/${STP_VIM_YOUCOMPLETEME}] Downloading the repository from GitHub" $CLR_LBLUE "y"
  git clone https://github.com/Valloric/YouCompleteMe.git
  colorize "YouCompleteMe [3/${STP_VIM_YOUCOMPLETEME}] Going to 'YouCompleteMe/'" $CLR_LBLUE "y"
  cd YouCompleteMe/
  colorize "YouCompleteMe [4/${STP_VIM_YOUCOMPLETEME}] Updating modules from GitHub" $CLR_LBLUE "y"
  git submodule update --init --recursive
  colorize "YouCompleteMe [5/${STP_VIM_YOUCOMPLETEME}] Launching installation script" $CLR_LBLUE "y"
  python install.py
  colorize "Installing YouCompleteMe... [DONE]" $CLR_LGREEN "y"
}
