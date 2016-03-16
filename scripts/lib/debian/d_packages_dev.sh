#!/bin/bash
#
#        Filename: d_packages_dev.sh
#     Description: ConfigThePenguin | Debian - Packages - Development
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-02-10 21:16:48
#        Modified: 2016-02-27 14:44:15
#
########################################################################################################################
# Debian | Packages | Install Packages for development
#    build-essential: all required packages for compiling a Debian package
#    cmake: cross-platform Makefile generator
#    exuberant-ctags: generator of tag files for source code
#    gdb: GNU Debugger
#    gdebi: tool to install '.deb' files
#    gedit: graphical editor
#    git: version control system
#    linux-headers: header files used to compile the kernel
#    make: tool to use Makefiles
#    nasm: Netwide Assembler
#    python: Python
#    python-dev: Python development
#    ruby: Ruby
#    ruby-dev: Ruby development
#    texlive-full: LaTeX
#    texmaker: LaTeX editor
#    vim: editor
#    vim-nox: vim with scripting languages support
function d_packages-dev_install()
{
  # List
  pldev=$(whiptail --title "Debian | Packages | Development" --checklist \
    "\nSelect Debian Packages to install for Development" 24 98 16 \
    "build-essential" "All required packages for compiling a Debian package" ON \
    "cmake" "Cross-platform Makefile generator" ON \
    "exuberant-ctags" "Generator of tag files for source code" ON \
    "gdb: GNU Debugger" ON \
    "gdebi" "Tool to install '.deb' files" ON \
    "gedit" "Graphical editor" ON \
    "git" "Version control system" ON \
    "linux-headers-$(uname -r)" "Header files used to compile the kernel" ON \
    "make" "Tool to use Makefiles" ON \
    "nasm" "Netwide Assembler" OFF \
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
    ctp-pkgs_d-install "Development" $STP_D_PKG_DEV "$pldev"
  # 'Cancel' option selected
  else
    __ctp-pkgs_d-abort
    exit 1
  fi
}
