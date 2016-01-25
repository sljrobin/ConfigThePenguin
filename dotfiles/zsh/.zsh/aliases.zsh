#!/bin/zsh
#
#        Filename: aliases.zsh
#     Description: Zsh | Aliases
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-01-18 16:32:56
#        Modified: 2016-01-23 12:12:19
#
########################################################################################################################
# Aliases | Set aliases for Git
function __zsh_aliases_git()
{
  alias gb='git branch'      # `gb`: show the branches
  alias gs='git status'      # `gs`: view the state of the working directory
  alias ga='git add'         # `ga`: include updates to a file in the next commit
  alias gaa='git add --all'  # `gaa`: include updates of all files in the next commit
  alias gc='git commit'      # `gc`: save updates
  alias gca='git commit -a'  # `gca`: save all updates
  alias gph='git push'       # `gph`: push local branch to a remote repository
  alias gphv='git push -v'   # `gphv`: push local branch to a remote repository with more details
  alias gpl='git pull'       # `gpl`: update remote-tracking branch
  alias gplv='git pull -v'   # `gplv`: update remote-tracking branch with more details
}


################################################################################
# Aliases | Set aliases for listing
function __zsh_aliases_list()
{
  # ls
  #   `-a`: do not ignore entries starting with `.`
  #   `-d`: list directories
  #   `-F`: append a character to each file indicating the file type
  #   `-G`: do not print group names in a long listing
  #   `-h`: print human readable sizes
  #   `-l`: long listing format
  #   `-s`: print the sizes

  alias ld='ls -ldGh --color=auto --time-style long-iso .*/ */'  # `ld`: list only directories
  alias ll='ls -laGFh --color=auto --time-style long-iso'        # `ll`: list information more verbose
  alias ls='ls --color=auto'                                     # `ls`: main list information
}


################################################################################
# Aliases | Set aliases for X
function __zsh_aliases_x()
{
  alias screens='xrandr --output eDP1 --mode 1920x1080 --output DP2 --mode 1920x1080 --right-of eDP1'  # `screens`: define a second monitor
  alias sx='startx'                                                                                    # `sx`: start the X Window Server
}


################################################################################
# Aliases | Main
function zsh_aliases()
{
  __zsh_aliases_git
  __zsh_aliases_list
  __zsh_aliases_x
}


########################################################################################################################
zsh_aliases
