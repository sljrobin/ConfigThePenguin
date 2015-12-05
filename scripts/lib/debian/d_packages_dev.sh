#!/bin/bash

########################################################################################################################
# Debian | Packages | List Packages for development
#    build-essential: all required packages for compiling a Debian package
#    cmake: cross-platform Makefile generator
#    exuberant-ctags: generator of tag files for source code
#    gdebi: tool to install '.deb' files
#    gedit: graphical editor
#    git: version control system
#    linux-headers: header files used to compile the kernel
#    make: tool to use Makefiles
#    python: Python
#    python-dev: Python development
#    ruby: Ruby
#    ruby-dev: Ruby development
#    texlive-full: LaTeX
#    texmaker: LaTeX editor
#    vim: editor
#    vim-nox: vim with scripting languages support
function __d_packages-dev_list()
{
  # List
  pldev=$(whiptail --title "Debian | Packages | Development" --checklist \
    "\nSelect Debian Packages to install for Development" 24 98 16 \
    "build-essential" "All required packages for compiling a Debian package" ON \
    "cmake" "Cross-platform Makefile generator" ON \
    "exuberant-ctags" "Generator of tag files for source code" ON \
    "gdebi" "Tool to install '.deb' files" ON \
    "gedit" "Graphical editor" ON \
    "git" "Version control system" ON \
    "linux-headers-$(uname -r)" "Header files used to compile the kernel" ON \
    "make" "Tool to use Makefiles" ON \
    "python" "Python" ON \
    "python-dev" "Python development" ON \
    "ruby" "Ruby" ON \
    "ruby-dev" "Ruby development" ON \
    "texlive-full" "LaTeX" ON \
    "texmaker" "LaTeX editor" ON \
    "vim" "Editor" ON \
    "vim-nox" "vim with scripting language support" ON 3>&1 1>&2 2>&3)
  # Exit status
  pl_status=$?
  # 'OK' option selected
  if [ $pl_status = 0 ]; then
    # Clean the package list
    pl_cleaned=$(ctp-parser_rmdquotes "$pldev")
    echo $pl_cleaned
  # 'Cancel' option selected
  else
    __ctp-pkgs_d-abort
    exit 1
  fi
}


########################################################################################################################
# Debian | Packages | Install Packages for development
function d_packages-dev_install()
{
  ctp-pkgs_d-install "Development" $STP_D_PKG_DEV __d_packages-dev_list 
}
