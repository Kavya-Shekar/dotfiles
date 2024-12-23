#!/bin/zsh

# Change the wallpaper
WALLPAPER_PATH="/$HOME/.config/dotfiles/yalamber-subba.jpg"
osascript -e "tell application \"System Events\" to set picture of every desktop to \"$WALLPAPER_PATH\""

# Change the trackpad speed to the fastest setting (3.0)
defaults write -g com.apple.trackpad.scaling -float 3.0

# Set the key repeat rate to the fastest (1)
defaults write -g KeyRepeat -int 1

# Set the initial key repeat delay to the shortest (10)
defaults write -g InitialKeyRepeat -int 10

# Set the dock to autohide
defaults write com.apple.dock autohide -bool true

# Enable network times and network time server
sudo systemsetup -setusingnetworktime on
sudo systemsetup -setnetworktimeserver time.apple.com

# Enable automatic timezone updates
sudo defaults write /Library/Preferences/com.apple.timezone.auto Active -bool true
