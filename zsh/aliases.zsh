alias reload="source ~/.zshrc"
alias aliases="vim ~/.dotfiles/zsh/aliases.zsh && reload"
alias rebrew="brew bundle install --file ~/.dotfiles/Brewfile"
alias brewfile="vim ~/.dotfiles/Brewfile && rebrew"

alias deploy="bundle exec fastlane deploy_all"
alias bi="bundle install"
alias webserver="open http://localhost:5001; ruby -run -e httpd -- -p 5001 ."

alias l='exa'
alias la='exa -a'
alias ll='exa -lah'
alias ls='exa --color=auto'

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

#Git
alias g='git status'
alias gb='git branch'
alias grc='git rebase --continue'
alias gpp='git pull --rebase && git push'
alias gmff='git merge --ff-only'
alias gpull='git pull origin master'
alias gpush='git push origin master'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gl='git log --oneline'

#create a new branch & switch to it
function gcb() {
  git checkout -b $*
}

#move to a branch
function gco() {
  git checkout $*
}

#commit pending changes and quote args
function gg() {
  git commit -v -a -m "$*"
}

# fetch gitignore templates from gitignore.io
function gi() {
  curl https://www.gitignore.io/api/$*
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
  puts files.first
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


