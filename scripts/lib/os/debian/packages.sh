#!/bin/bash

########################################################################################################################
# Install the main colorscheme
function debian_install_colorscheme()
{
  colorize "Installing base16..." $CLR_LPURPLE "y"
  colorize "base16 [1/${STP_D_PKG_COLORSCHEME}] Downloading the repository from GitHub" $CLR_LBLUE "y"
  git clone https://github.com/chriskempson/base16-shell.git /home/sljrobin/.config/base16-shell
  colorize "base16 [2/${STP_D_PKG_COLORSCHEME}] Choosing 'base16 default dark'" $CLR_LBLUE "y"
  sh /home/sljrobin/.config/base16-shell/base16-default.dark.sh
  colorize "Installing base16... [DONE]" $CLR_LGREEN "y"
}


########################################################################################################################
# Install Packages for development
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
function debian_install_dev()
{
  aptitude -y install \
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
function debian_install_gui()
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
#    mpv: video player
#    ncmpcpp: ncurses based mpd client
#    vlc: media player
function debian_install_media()
{
  aptitude -y install \
    alsa-utils \
    alsa-oss \
    mpd \
    mpc \
    mpv \
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
#    rtorrent: BitTorrent client
#    wicd-curses: wired and wireless network manager
function debian_install_network()
{
  aptitude -y install \
    curl \
    ethtool \
    iceweasel \
    flashplugin-nonfree \
    nslookup \
    openvpn \
    rtorrent \
    wicd-curses
}


########################################################################################################################
# Install Packages for miscellaneous tools
#    bc: calculator
#    calibre: ePUB viewer
#    evince: PDF viewer
#    newsbeuter: RSS feed reader
#    p7zip: handle .7zip archives
#    tmux: terminal multiplexer
#    tree: recursive directory listing program
#    unrar: handle .rar archives
#    unzip: handle .zip archives
#    weechat: IRC client
#    xpdf: PDF viewer
#    zsh: Z shell
function debian_install_utils()
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
    xpdf \
    zsh
}
