alias cat="bat"
alias deploy="bundle exec fastlane deploy_all"
alias burnpack="bundle install && yarn install && ./bin/webpack"
alias bi="bundle install"
alias webserver="open http://localhost:5001; ruby -run -e httpd -- -p 5001 ."

# Use Neovim as "preferred editor"
export VISUAL=nvim
# Use Neovim instead of Vim or Vi
alias vim=nvim
alias vi=nvim”


alias ..="cd .."

# quick edit aliases
alias reload="source ~/.bash/aliases.bash"
alias ea='vim ~/.bash/aliases.bash && reload'

# See disk usage in the current folder only
alias ds='du -h -d 1'

alias ll='ls -l'
alias la='ls -la'
alias cpwd='pwd | pbcopy' #copy working directory
alias cpdir=cpwd

#terminal
function title() {
  echo -n -e "\033]0;$1\007"
}

#Finder
alias o='open . &'

#Processes
alias tu='top -o cpu' # processes sorted by CPU
alias tm='top -o vsize' # processes sorted by Memory

#Rails
alias rs='bundle exec rails server'
alias r='rake'
alias rmig='bundle exec rake db:migrate'
alias rc='bundle exec rails console'

# Fastlane
function bef {
  bundle exec fastlane $*
}
function push {
  xcrun simctl push booted $*
}

# CocoaPods
alias pod-dev=$HOME/projects/CocoaPods/bin/pod

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

# Pretty-printing
alias format_json='python -m json.tool'

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

# starts an HTTP server on port 8000
alias pserve='python -m SimpleHTTPServer 8000'

tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}


