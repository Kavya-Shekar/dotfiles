#!/bin/bash

# Function to check for Git and install Git on macOS
# through Xcode Command Line Tools if necessary
install_git_macos() {
	if ! type git > /dev/null 2>&1; then
		echo "Git not found. Installing Xcode Command Line Tools..."
		xcode-select --install

	# Wait until Xcode Command Line Tools installation is finished
	until xcode-select --print-path &>/dev/null; do
		sleep 5
	done

	# Accept the Xcode Command Line Tools license
	sudo xcodebuild -license accept
else
	echo "Git exists"
	fi
}

# TODO: setup github repository
# Function to git-clone dotfiles
setup_dotfiles() {
	DOTFILES_DIR="$HOME/.config/dotfiles"
	DOTFILES_REPO="https://github.com/kavya-shekar/dotfiles.git"

	# if [ -d "$DOTFILES_DIR" ]; then
	# 	echo "$DOTFILES_DIR exists. Checking git repository..."
	# 	cd "$DOTFILES_DIR"
	# 	CURRENT_REPO=$(git config --get remote.origin.url)
	# 	if [ "$CURRENT_REPO" = "$DOTFILES_REPO" ]; then
	# 		echo "Correct git repository. Pulling latest changes..."
	# 		git pull
	# 	else
	# 		echo "Incorrect git repository. Please check your setup."
	# 	fi
	# else
		echo "Cloning dotfiles repository..."
		git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
		cd "$DOTFILES_DIR"
	# fi
}

# Detecting OS
OS="Unknown"
case "$(uname -s)" in
	Darwin)
		OS="macOS"
		;;
	Linux)
		if [ -f /etc/os-release ]; then
			. /etc/os-release
			if [ "$NAME" = "Ubuntu" ]; then
				OS="Ubuntu"
			fi
		fi
		;;
esac

# Installing Git and setting up dotfiles based on detected OS
case "$OS" in
	"macOS")
	    echo "macOS platform detected"
		install_git_macos
		setup_dotfiles
		cd ~/.config/dotfiles
		zsh -c mac/setup.zsh
		;;
	*)
		echo "Unsupported OS: $OS"
		exit 1
		;;
esac

echo "Setup completed on $OS."
