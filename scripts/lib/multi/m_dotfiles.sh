#!/bin/bash


########################################################################################################################
# Multi | Dotfiles | Create links for Conky
function __m_dotfiles-conky()
{
  __ctp-dots_checkf "$DIR_CONKYRC"
  __ctp-dots_symlnk "$DIR_CTP_CONKYRC" "$DIR_CONKYRC"
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

# Multi | Dotfiles | Create links for xinit
function __m_dotfiles-xinit()
{
  __ctp-dots_checkf "$DIR_XINITRC"
  __ctp-dots_symlnk "$DIR_CTP_XINITRC" "$DIR_XINITRC"
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
  return $?
}

# Multi | Dotfiles | Create links for Zsh
function __m_dotfiles-zsh()
{
  __ctp-dots_checkf "$DIR_ZSHRC"
  __ctp-dots_symlnk "$DIR_CTP_ZSHRC" "$DIR_ZSHRC"
  return $?
}


########################################################################################################################
# Multi | Dotfiles | Link
function m_dotfiles_link()
{
  __ctp-dots_step "01" "Linking xinit" __m_dotfiles-xinit
  __ctp-dots_step "02" "Linking Xresources" __m_dotfiles-xresources
  __ctp-dots_step "03" "Linking xmonad" __m_dotfiles-xmonad
  __ctp-dots_step "04" "Linking Zsh" __m_dotfiles-zsh
  __ctp-dots_step "05" "Linking vim" __m_dotfiles-vim
  __ctp-dots_step "06" "Linking Git" __m_dotfiles-git
  __ctp-dots_step "07" "Linking tmux" __m_dotfiles-tmux
  __ctp-dots_step "08" "Linking Conky" __m_dotfiles-conky
  __ctp-dots_step "09" "Linking rTorrent" __m_dotfiles-rtorrent
  __ctp-dots_step "10" "Linking Newsbeuter" __m_dotfiles-newsbeuter
  __ctp-dots_step "11" "Linking MPD" __m_dotfiles-mpd
  __ctp-dots_step "12" "Linking ncmpcpp" __m_dotfiles-ncmpcpp
}
