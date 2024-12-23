#!/bin/zsh

# Check if Pure prompt is installed
PURE_DIR="$HOME/.zsh/pure"
if [ -d "$PURE_DIR" ]; then
  echo "Pure prompt is already installed."
else
  echo "Pure prompt is not installed. Installing..."
  mkdir -p "$HOME/.zsh"
  git clone https://github.com/sindresorhus/pure.git "$PURE_DIR"
fi

# Check if .zshrc is symlinked correctly
ZSHRC_TARGET="$HOME/.config/dotfiles/zsh/zshrc"
ZSHRC_LINK="$HOME/.zshrc"
if [ -L "$ZSHRC_LINK" ] && [ "$(readlink $ZSHRC_LINK)" = "$ZSHRC_TARGET" ]; then
  echo ".zshrc is correctly symlinked."
else
  echo ".zshrc is not correctly symlinked. Creating symlink..."
  ln -sf "$ZSHRC_TARGET" "$ZSHRC_LINK"
fi

echo "zsh setup complete."
