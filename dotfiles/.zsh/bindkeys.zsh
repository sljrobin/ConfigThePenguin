# History searching
bindkey "^R" history-incremental-search-backward # 'Ctrl' + 'r'
bindkey "[B" history-search-forward              # 'Down arrow'
bindkey "[A" history-search-backward             # 'Up arrow'

# Character manipulations
bindkey "^D" delete-char   # 'Ctrl' + 'd'
bindkey "^F" forward-char  # 'Ctrl' + 'f'
bindkey "^B" backward-char # 'Ctrl' + 'b'

# Word manipulations
bindkey ";5C" forward-word  # 'Ctrl' + 'Left arrow'
bindkey ";5D" backward-word # 'Ctrl' + 'Right arrow'

# Line manipulations
bindkey "^A" beginning-of-line # 'Ctrl' + 'a'
bindkey "^E" end-of-line       # 'Ctrl' + 'e'
bindkey "^K" kill-whole-line   # 'Ctrl' + 'k'
