source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/prompt.zsh


autoload -U colors && colors

setopt AUTOCD # Change directory without typing the `cd` command


unsetopt MENU_COMPLETE # Do not insert the first match immediately 

# Bindkeys
# Use `read` to find the keys typed
# \e = ^[

zstyle ':completion:*' menu select # Enable a graphical menu
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit


# nyae
#  n: no
#  y: yes
#  a: abort
#  e: edit

setopt CORRECT  # Correct command line
# Type ! + command line to search in the history
#
#
# > redirect stdout to a file
# >> appends text to an existing file
#

# Find escape sequences with the read commands


# https://dustri.org/b/my-zsh-configuration.html
# https://github.com/fishilico/home-files/blob/master/dotfiles/shell/zshcompletion
# https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh
