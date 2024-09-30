alias -s {rs,md}=vim
bindkey '^ ' autosuggest-accept

alias c="pbcopy"
alias new-worktree="source new-exceed-worktree"
alias burnpack="bundle install && yarn install && RAILS_ENV=development bin/vite build"
alias refresh-rails="cp ../.env . && burnpack && bundle exec rails db:migrate && bundle exec rails db:migrate RAILS_ENV=test"
alias reload="source ~/.zshrc"
alias aliases="vim ~/.dotfiles/zsh/aliases.zsh && reload"
alias rebrew="brew bundle install --file ~/.dotfiles/Brewfile"
alias brewfile="vim ~/.dotfiles/Brewfile && rebrew"
alias bf="brewfile"
alias vimrc="vim ~/.config/nvim/lua/custom/init.lua"
alias show_sim_touch="defaults write com.apple.iphonesimulator ShowSingleTouches 1"
alias tn="tmux new -s $(basename $(pwd))"
alias gcd='cd "$(git worktree list --porcelain | grep worktree | awk '"'"'{print $2}'"'"' | fzf)"'

alias r=ranger
alias cat=bat

alias w="wiki-tui"
alias d="deploy"
alias deploy="bundle exec fastlane deploy_all"
alias bi="bundle install"
alias webserver="open http://localhost:5001; ruby -run -e httpd -- -p 5001 ."
alias list_feats="git log $(git tag --sort=-creatordate | head -n 2 | tail -n 1)...HEAD --pretty=format:'%<(20)%ar %s' | grep 'feat:'"

alias l='eza'
alias la='eza -a'
alias ls='eza -lah'

# Projects
alias m='cd mobile-core'
alias e='cd exceed-ios-simplified'
alias d='cd exceed-ios'
alias s='cd tribe-ios'

# Timezones
alias tzPST="echo `env TZ=US/Pacific date +%H:%M`"
alias tzEST="echo `env TZ=US/New_York date +%H:%M`"
alias tzCET="echo `env TZ=Europe/Berlin date +%H:%M`"
alias tzBST="echo `env TZ=Europe/London date +%H:%M`"
alias tzAEST="echo `env TZ=Australia/Brisbane date +%H:%M`"

#Finder
alias o='open . &'

# Fastlane
function bef {
  bundle exec fastlane $*
}

# bundler
function be() {
  bundle exec $*
}

#Rails
alias rc='bundle exec rails console'
alias rs='bundle exec rails server'
alias rdbm='rake db:migrate db:test:clone_structure'

#Git
alias lg='lazygit'
alias g='git status'
alias gb='git branch'
alias grc='git rebase --continue'
alias gpp='git pull --rebase && git push'
alias gmff='git merge --ff-only'
alias gpull='git pull origin master'
alias gp='git push origin master'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gl='git log --oneline'

#create a new branch & switch to it
function gcb() {
  git switch -c $*
}

#move to a branch
function gsw() {
  git switch $*
}

#commit pending changes and quote args
function gg() {
  git commit -v -a -m "$*"
}

# fetch gitignore templates from gitignore.io
function gi() {
  curl https://www.toptal.com/developers/gitignore/api/$* > .gitignore
}

alias gd='git diff'


# Xcode

function xc() {
  project_file=$(cat <<EOF | ruby -rfileutils
  files = Dir.glob('**/*.{xcworkspace,xcodeproj}')
    .reject {|p|
      p.include?('Pods') ||
      p.include?('xcodeproj/project.xcworkspace') }
    .map {|x| [x, x.scan(/\//).count]}
    .sort {|a, b| a.last <=> b.last || a.first <=> b.first }
    .map {|x| x.first }
  puts (files + Dir.glob('Package.swift')).first
EOF
)

  if [ -z "$project_file" ]
  then
    echo "Couldn't find a workspace or a project to open."
  else
    echo "Opening $project_file..."
    open "$project_file" -a /Applications/Xcode.app
  fi
}


