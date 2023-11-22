CDPATH=~/Documents/Code/
setopt auto_cd # allow typing just the name of the directory to change into it.
setopt autopushd # push the old directory onto the directory stack on cd.
setopt append_history # Make sure windows don't overwrite each others history when exiting all at the same time.
setopt share_history # Share history between windows.

# No bell: Shut up Zsh
unsetopt BEEP

ANDROID_HOME=/Users/swilliams/Library/Android/sdk

PATH=~/Documents/Code/sonar-scanner-4.8.0.2856-macosx/bin:${PATH}
PATH=~/.emacs.d/bin:${PATH}
PATH=~/go/bin:${PATH}
PATH=~/bin:${PATH}
PATH=~/.local/bin:${PATH}
PATH=~/.nodenv/shims:${PATH}

PATH=~/.gvm/bin:${PATH}
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

. "$HOME/.cargo/env"

# case insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

# aliases
alias v="vim"

if [ $(command -v nvim) ]; then
  export EDITOR=$(which nvim)
  alias vim=$EDITOR
  alias v=$EDITOR
fi

export SUDO_EDITOR=$EDITOR
export VISUAL=$EDITOR

source ~/.dotfiles/zsh/shortcuts.zsh
source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/sensible.zsh
source ~/.env

eval "$(zoxide init zsh)"

# rbenv
eval "$(/opt/homebrew/bin/rbenv init - zsh)"
export PATH="$(brew --prefix)/opt/postgresql@12/bin:$PATH"

# Save command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
eval "$(starship init zsh)"
