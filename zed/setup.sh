DOTFILES="$HOME/.config/dotfiles"

# Symlink Tmux configuration file
echo "Symlinking zed configuration..."
ln -sf "$DOTFILES/zed/settings.json" "$HOME/.config/zed/settings.json"
