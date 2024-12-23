#!/bin/zsh

# Set dotfiles and tmp directory
DOTFILES="$HOME/.config/dotfiles"
TPM_DIR="$HOME/.tmux/plugins/tpm"

# Install Tmux Plugin Manager (TPM)
if [[ ! -d "$TPM_DIR" ]]; then
    echo "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "Tmux Plugin Manager is already installed."
fi

# Symlink Tmux configuration file
echo "Symlinking Tmux configuration..."
ln -sf "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"

tmux source "$HOME/.tmux.conf"

# Install Tmux plugins
echo "Installing Tmux plugins..."
"$TPM_DIR/bin/install_plugins"  # Install plugins

echo "Tmux setup complete!"
