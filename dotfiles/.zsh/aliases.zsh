## Aliases

# Navigation
alias .='cd ..'                            # 1 before current
alias ..='cd ../..'                        # 2 before current
alias ...='cd ../../..'                    # 3 before current
alias ....='cd ../../../..'                # 4 before current
alias .....='cd ../../../../..'            # 5 before current
alias ......='cd ../../../../../..'        # 6 before current
alias .......='cd ../../../../../../..'    # 7 before current

# Listing
alias ls='ls -GFh --color=auto'
alias ll='ls -GFhla --color'
alias ld='ls -la | grep "^d"'

# Git
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gp='git push'
alias gb='git branch'

# System
alias dl="sudo aptitude install"
alias off="echo 'The system is going to shutdown' && sudo init 0"    # Shutdown
alias mkdir='mkdir -pv'
alias bat='acpi'
alias sx='startx'
alias kimsufi='ssh sljrobin@94.23.43.27 -p 55688'

# Nanoc
alias ncv='nanoc compile --verbose && nanoc view'    # Compile and print website

## TODO: print battery power
##       print + or -
