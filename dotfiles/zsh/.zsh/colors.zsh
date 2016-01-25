#!/bin/zsh
#
#        Filename: colors.zsh
#     Description: Zsh | Colors
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-01-18 17:13:14
#        Modified: 2016-01-18 17:27:12
#
########################################################################################################################
# Colors | Load colorscheme
function __zsh_colors_load()
{
  BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
}


################################################################################
# Colors | Main
function zsh_colors()
{
  __zsh_colors_load
}


########################################################################################################################
zsh_colors
