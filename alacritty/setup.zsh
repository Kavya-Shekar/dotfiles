#!/bin/zsh

set -e  # Exit immediately if a command exits with a non-zero status

echo "Setting up Alacritty environment..."

# Define the directory where this script is located (dotfiles repository)
DOTFILES="$HOME/.config/dotfiles"
ALACRITTY_CONFIG_DIR="$HOME/.config/alacritty"

# Clone Catppuccin themes if not already cloned
CATPPUCCIN_REPO_DIR="$ALACRITTY_CONFIG_DIR/catppuccin"
if [[ ! -d "$CATPPUCCIN_REPO_DIR" ]]; then
    echo "Cloning Catppuccin themes..."
    git clone https://github.com/catppuccin/alacritty.git "$CATPPUCCIN_REPO_DIR"
else
    echo "Catppuccin themes already cloned."
fi

# Symlink alacritty.toml
echo "Symlinking alacritty.toml..."
ln -sf "$DOTFILES/alacritty/config.toml" "$ALACRITTY_CONFIG_DIR/alacritty.toml"
echo "Alacritty setup complete!"
