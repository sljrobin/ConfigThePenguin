#!/bin/bash


########################################################################################################################
# Multi | Dotfiles | Create links for Conky
function __m_dotfiles-conky()
{
  __ctp-dots_checkf "$DIR_CONKYRC"
  __ctp-dots_symlnk "$DIR_CTP_CONKYRC" "$DIR_CONKYRC"
  return $?
}

# Multi | Dotfiles | Create links for Dzen
function __m_dotfiles-dzen()
{
  __ctp-dots_checkd "$DIR_DZEN2"
  __ctp-dots_symlnk "$DIR_CTP_DZEN2" "$DIR_DZEN2"
  return $?
}

# Multi | Dotfiles | Create links for Git
function __m_dotfiles-git()
{
  __ctp-dots_checkf "$DIR_GITCONFIG"
  __ctp-dots_symlnk "$DIR_CTP_GITCONFIG" "$DIR_GITCONFIG"
  return $?
}

# Multi | Dotfiles | Create links for MPD
function __m_dotfiles-mpd()
{
  __ctp-dots_checkd "$DIR_MPD"
  __ctp-dots_symlnk "$DIR_CTP_MPD" "$DIR_MPD"
  return $?
}

# Multi | Dotfiles | Create links for ncmpcpp
function __m_dotfiles-ncmpcpp()
{
  __ctp-dots_checkd "$DIR_NCMPCPP"
  __ctp-dots_symlnk "$DIR_CTP_NCMPCPP" "$DIR_NCMPCPP"
  return $?
}

# Multi | Dotfiles | Create links for Newsbeuter
function __m_dotfiles-newsbeuter()
{
  __ctp-dots_checkd "$DIR_NEWSBEUTER"
  __ctp-dots_symlnk "$DIR_CTP_NEWSBEUTER" "$DIR_NEWSBEUTER"
  return $?
}

# Multi | Dotfiles | Create links for rTorrent
function __m_dotfiles-rtorrent()
{
  __ctp-dots_checkf "$DIR_RTORRENTRC"
  __ctp-dots_symlnk "$DIR_CTP_RTORRENTRC" "$DIR_RTORRENTRC"
  return $?
}

# Multi | Dotfiles | Create links for tmux
function __m_dotfiles-tmux()
{
  __ctp-dots_checkf "$DIR_TMUXCONF"
  __ctp-dots_symlnk "$DIR_CTP_TMUXCONF" "$DIR_TMUXCONF"
  __ctp-dots_checkd "$DIR_TMUX"
  __ctp-dots_symlnk "$DIR_CTP_TMUX" "$DIR_TMUX"
  return $?
}

# Multi | Dotfiles | Create links for urxvt
function __m_dotfiles-urxvt()
{
  __ctp-dots_checkd "$DIR_URXVT"
  __ctp-dots_symlnk "$DIR_CTP_URXVT" "$DIR_URXVT"
  return $?
}

# Multi | Dotfiles | Create links for vim
function __m_dotfiles-vim()
{
  __ctp-dots_checkf "$DIR_VIMRC"
  __ctp-dots_symlnk "$DIR_CTP_VIMRC" "$DIR_VIMRC"
  __ctp-dots_checkd "$DIR_VIM_MAIN"
  __ctp-dots_symlnk "$DIR_CTP_VIM_MAIN" "$DIR_VIM_MAIN"
  return $?
}

# Multi | Dotfiles | Create links for X
function __m_dotfiles-x()
{
  __ctp-dots_checkf "$DIR_XINITRC"
  __ctp-dots_symlnk "$DIR_CTP_XINITRC" "$DIR_XINITRC"
  __ctp-dots_checkd "$DIR_XINITRCD"
  __ctp-dots_symlnk "$DIR_CTP_XINITRCD" "$DIR_XINITRCD"
  __ctp-dots_checkf "$DIR_XSERVERRC"
  __ctp-dots_symlnk "$DIR_CTP_XINITRC" "$DIR_XSERVERRC"
  __ctp-dots_checkf "$DIR_XSESSION"
  __ctp-dots_symlnk "$DIR_CTP_XINITRC" "$DIR_XSESSION"
  return $?
}

# Multi | Dotfiles | Create links for xmonad
function __m_dotfiles-xmonad()
{
  __ctp-dots_checkd "$DIR_XMONAD"
  __ctp-dots_symlnk "$DIR_CTP_XMONAD" "$DIR_XMONAD"
  return $?
}

# Multi | Dotfiles | Create links for Xresources
function __m_dotfiles-xresources()
{
  __ctp-dots_checkf "$DIR_XRESOURCES"
  __ctp-dots_symlnk "$DIR_CTP_XRESOURCES" "$DIR_XRESOURCES"
  __ctp-dots_checkd "$DIR_XRESOURCESD"
  __ctp-dots_symlnk "$DIR_CTP_XRESOURCESD" "$DIR_XRESOURCESD"
  return $?
}

# Multi | Dotfiles | Create links for Zsh
function __m_dotfiles-zsh()
{
  __ctp-dots_checkf "$DIR_ZSHRC"
  __ctp-dots_symlnk "$DIR_CTP_ZSHRC" "$DIR_ZSHRC"
  __ctp-dots_checkd "$DIR_ZSH_MAIN"
  __ctp-dots_symlnk "$DIR_CTP_ZSH_MAIN" "$DIR_ZSH_MAIN"
  return $?
}


########################################################################################################################
# Multi | Dotfiles | Link
function m_dotfiles_link()
{
  __ctp-dots_step "01" "Linking X" __m_dotfiles-x
  __ctp-dots_step "02" "Linking Xresources" __m_dotfiles-xresources
  __ctp-dots_step "03" "Linking rxvt-unicode" __m_dotfiles-urxvt
  __ctp-dots_step "04" "Linking xmonad" __m_dotfiles-xmonad
  __ctp-dots_step "05" "Linking Dzen" __m_dotfiles-dzen
  __ctp-dots_step "06" "Linking Zsh" __m_dotfiles-zsh
  __ctp-dots_step "07" "Linking vim" __m_dotfiles-vim
  __ctp-dots_step "08" "Linking Git" __m_dotfiles-git
  __ctp-dots_step "09" "Linking tmux" __m_dotfiles-tmux
  __ctp-dots_step "10" "Linking Conky" __m_dotfiles-conky
  __ctp-dots_step "11" "Linking rTorrent" __m_dotfiles-rtorrent
  __ctp-dots_step "12" "Linking Newsbeuter" __m_dotfiles-newsbeuter
  __ctp-dots_step "13" "Linking MPD" __m_dotfiles-mpd
  __ctp-dots_step "14" "Linking ncmpcpp" __m_dotfiles-ncmpcpp
}
