#!/bin/bash

source _core.sh


########################################################################################################################
# Install the main colorscheme
function debian_install_packages_colorscheme()
{
  colorize "Installing base16..." $CLR_LPURPLE "y"
  colorize "base16 [1/${STP_PKG_COLORSCHEME}] Downloading the repository from GitHub" $CLR_LBLUE "y"
  git clone https://github.com/chriskempson/base16-shell.git /home/sljrobin/.config/base16-shell
  colorize "base16 [2/${STP_PKG_COLORSCHEME}] Choosing 'base16 default dark'" $CLR_LBLUE "y"
  sh /home/sljrobin/.config/base16-shell/base16-default.dark.sh
  colorize "Installing base16... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Install Packages for development
#    build-essential: all required packages for compiling a Debian package
#    cmake: cross-platform Makefile generator
#    exuberant-ctags: generator of tag files for source code
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
function debian_install_packages_dev()
{
  aptitude -y install \
    build-essential \
    cmake \
    exuberant-ctags \
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
# Install GUI and misc tools
#    conky: system monitor
#    dzen2: notifications for X11
#    fonts-droid: 'Droid Sans Mono' font
#    gmrun: application launcher
#    rxvt-unicode-256color: terminal emulator with Unicode support
#    suckless-tools: dmenu
#    xbacklight: tool to manage brightness
#    xmonad: GUI
#    xorg: X window system
#    xscreensaver: a screensaver
#    xserver-xorg-core: xserver
function debian_install_packages_gui()
{
  aptitude -y install \
    xorg \
    xserver-xorg-core \
    xmonad \
    conky \
    dzen2 \
    fonts-droid \
    gmrun \
    rxvt-unicode-256color \
    suckless-tools \
    xbacklight \
    xscreensaver
}


########################################################################################################################
# Install Packages for Media (music/video)
#    alsa-utils: various ALSA command line tools
#    alsa-oss: OSS compatibility layer
#    mpd: music player daemon
#    mpc: music player client
#    mplayer2: video player
#    ncmpcpp: ncurses based mpd client
#    vlc: media player
function debian_install_packages_media()
{
  aptitude -y install \
    alsa-utils \
    alsa-oss \
    mpd \
    mpc \
    mplayer2 \
    ncmpcpp \
    vlc
}


########################################################################################################################
# Install Packages for Internet
#    curl: tool to transfer a url
#    ethtool: utility to get information about Network Interface Controllers
#    iceweasel: web browser
#    flashplugin-nonfree: Adobe Flash
#    nslookup: manage DNS queries
#    openvpn: VPN
#    wicd-curses: wired and wireless network manager
function debian_install_packages_network()
{
  aptitude -y install \
    curl \
    ethtool \
    iceweasel \
    flashplugin-nonfree \
    nslookup \
    openvpn \
    wicd-curses
}


########################################################################################################################
# Install Packages for miscellaneous tools
#    bc: calculator
#    calibre: ePUB reader
#    evince: PDF reader
#    newsbeuter: RSS feed reader
#    p7zip: handle .7zip archives
#    tmux: terminal multiplexer
#    tree: recursive directory listing program
#    unrar: handle .rar archives
#    unzip: handle .zip archives
#    weechat: IRC client
#    zsh: Z shell
function debian_install_packages_utils()
{
  aptitude -y install \
    bc \
    calibre \
    evince \
    newsbeuter \
    p7zip \
    tmux \
    tree \
    unrar \
    unzip \
    weechat \
    zsh
}
