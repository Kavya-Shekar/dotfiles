#!/bin/zsh

# This installs some of the common apps needed using Homebrew.

# Check for Homebrew
if ! command -v brew &>/dev/null;
then
  echo "Installing Homebrew for you."

  # Install homebrew
  NONINTERACTIVE=1 /bin/bash -c \
	  "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# brew bundle --file=$PWD/Brewfile
grep -E '^(brew|cask)' $HOME/.config/dotfiles/homebrew/Brewfile | awk '{print $2}' | xargs -P4 -n1 brew install
echo 'Homebrew setup complete.'

exit 0
