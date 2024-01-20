DEST_PATH="~/.dotfiles"
if [[ $(pwd) = "$(echo ~)/.dotfiles" ]]
then
  echo "Installing.."
  ~/.dotfiles/set-defaults.sh
  xcode-select --install
  if ! command -v brew &> /dev/null
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  brew bundle install --file Brewfile
else
  echo    # move to a new line
  read -p "Dotfiles should be in ~/.dotfiles. Would you like to move them there? (y/n): " -n 1 -r
  echo    # move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
      SRC_PATH=$(pwd)
      cd ..
      mv "$SRC_PATH" ~/.dotfiles
      cd ~/.dotfiles
  fi
fi
