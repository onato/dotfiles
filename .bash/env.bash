export EDITOR="nvim"
export TERM=xterm
export CLICOLOR=1
export PATH=~/.ec2/bin:/usr/local/bin:/usr/local/heroku/bin:/usr/local/sbin:~/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=/Applications/MacVim.app/Contents/bin/:"${PATH}"
export PATH=~/Library/Python/2.7/bin:"${PATH}"
export PATH=/Applications/Postgres.app/Contents/Versions/12/bin:"${PATH}"

export JAVA_HOME="$(/usr/libexec/java_home)"
export ANDROID_HOME=~/Library/Android/sdk

export UI_AUTOMATION_HOME=~/Code/Intellum/tribe-mobile-ui-automation/
export PATH=$UI_AUTOMATION_HOME/batch:"${PATH}"

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
export PATH=$PATH:$VIMCONFIG/pack/bundle/start/fzf/bin
export FZF_DEFAULT_COMMAND='rg --files'

export EC2_HOME=~/.ec2
# export JAVA_HOME=`/usr/libexec/java_home` # http://stackoverflow.com/questions/6588390/where-is-java-home-on-osx-yosemite-10-10-mavericks-10-9-mountain-lion-10


# Load secrets into ENV if present
secrets_path=~/.bash/secrets.bash
[ -f $secrets_path ] && source $secrets_path

docker_vars_path=~/.dockerrc
[ -f $docker_vars_path ] && source $docker_vars_path

