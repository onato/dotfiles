setopt HIST_IGNORE_ALL_DUPS

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line

