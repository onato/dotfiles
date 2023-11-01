CDPATH=~/Documents/Code/
setopt auto_cd # allow typing just the name of the directory to change into it.
setopt autopushd # push the old directory onto the directory stack on cd.
setopt append_history # Make sure windows don't overwrite each others history when exiting all at the same time.
setopt share_history # Share history between windows.

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
bindkey '^ ' autosuggest-accept

bindkey -e

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
  export EDITOR=$(which lvim)
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

source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# rbenv
eval "$(/opt/homebrew/bin/rbenv init - zsh)"
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"

# Save command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
