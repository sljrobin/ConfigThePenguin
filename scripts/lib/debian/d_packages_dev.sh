#!/bin/bash

########################################################################################################################
# Debian | Packages | Install main Packages for development
#    build-essential: all required packages for compiling a Debian package
#    cmake: cross-platform Makefile generator
#    exuberant-ctags: generator of tag files for source code
#    gdebi: tool to install '.deb' files
#    gedit: graphical editor
#    git: version control system
#    jekyll: static site generator
#    linux-headers: header files used to compile the kernel
#    make: tool to use Makefiles
#    python/python-dev: Python
#    ruby/ruby-dev: Ruby
#    texlive-full: LaTeX
#    texmaker: LaTeX editor
#    vim: editor
#    vim-nox: vim with scripting languages support
function __d_packages_dev_main()
{
  aptitude install \
    build-essential \
    cmake \
    exuberant-ctags \
    gdebi \
    gedit \
    git \
    linux-headers-$(uname -r) \
    make \
    python python-dev \
    ruby ruby-dev \
    gem install jekyll \
    texlive-full \
    texmaker \
    vim vim-nox
}


########################################################################################################################
# Debian | Packages | Install Packages for development
function d_packages_dev()
{
  # Dev | Main packages
  colorize "[1/${STP_D_PKG_DEV}] Installing Debian Development Packages (Main)..." $CLR_LBLUE "y"
  __d_packages_dev_main
  colorize "[1/${STP_D_PKG_DEV}] Installing Debian Development Packages (Main)..." $CLR_LBLUE "n"
  colorize " [DONE]" $CLR_LGREEN "y"
}
