#!/bin/zsh

CONFIG="$HOME/.config/dotfiles"

# Function to prompt for sudo and keep it alive
keep_sudo_alive() {
  while true; do
    sudo -v
    sleep 50
    kill -0 "$$" || exit
  done &
}

# Prompt for sudo access initially
sudo -v

# Start the background process to keep sudo alive
keep_sudo_alive

# Set default settings
zsh -c $CONFIG/mac/set-defaults.zsh

# Install homebrew and brew dependencies
zsh -c $CONFIG/homebrew/install.zsh

# Setup zsh
zsh -c $CONFIG/zsh/setup.zsh

# Setup alacritty
zsh -c $CONFIG/alacritty/setup.zsh

# Setup vim
# zsh -c $CONFIG/vim/setup.zsh

# Setup tmux
zsh -c $CONFIG/tmux/setup.zsh

# Setup ssh
zsh  -c $CONFIG/ssh/setup.zsh
