
# Colorscheme: Base16
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL



## Prompt
#   `%n`: name
#   `%m`: hostname
#   `%~`: current working directory
#
#   Prompt User: <name>@<hostname>:<path>%
#   Prompt Root: <name>@<hostname>:<path>#
PROMPT='%n@%m:%~%# '


alias sx='startx'                        # `sx`: start the X Window Server

## ls
#   `-a`: do not ignore entries starting with `.`
#   `-d`: list directories
#   `-F`: append a character to each file indicating the file type
#   `-G`: do not print group names in a long listing
#   `-h`: print human readable sizes
#   `-l`: long listing format
#   `-s`: print the sizes
alias ld='ls -ldGh --color=auto --time-style long-iso .*/ */' # `ld`: list only directories
alias ll='ls -laGFh --color=auto --time-style long-iso'       # `ll`: list information more verbose
alias ls='ls --color=auto'                                    # `ls`: main list information

## git
# Branch
alias gb='git branch'                    # `gb`: show the branches
# Status
alias gs='git status'                    # `gs`: view the state of the working directory
# Add
alias ga='git add'                       # `ga`: include updates to a file in the next commit
alias gaa='git add --all'                # `gaa`: include updates of all files in the next commit
# Commit
alias gc='git commit'                    # `gc`: save updates
alias gca='git commit -a'                # `gca`: save all updates
# Push
alias gph='git push'                     # `gph`: push local branch to a remote repository
alias gphv='git push -v'                 # `gphv`: push local branch to a remote repository with more details
# Pull
alias gpl='git pull'                     # `gpl`: update remote-tracking branch
alias gplv='git pull -v'                 # `gplv`: update remote-tracking branch with more details


alias screens='xrandr --output eDP1 --mode 1920x1080 --output DP2 --mode 1920x1080 --right-of eDP1'


setopt AUTOCD # Change directory without typing the `cd` command


unsetopt MENU_COMPLETE # Do not insert the first match immediately 

# Bindkeys
# Use `read` to find the keys typed
# \e = ^[
bindkey '\e[1;5D' backward-word          # <Ctrl> + <Left>: backward word
bindkey '\e[1;5C' forward-word           # <Ctrl> + <Right>: forward word
bindkey '\e[7~'   beginning-of-line      # <Home>: go to the beginning of the line
bindkey '\e[8~'   end-of-line            # <End>: go to the end of the line
bindkey '\e[3~'   delete-char            # <Delete>: delete a character
bindkey '\e[Z'    reverse-menu-complete  # <Shift> + <Tab>: backward tab


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
