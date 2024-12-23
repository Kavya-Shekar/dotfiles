#!/bin/zsh

DOTFILES="$HOME/.config/dotfiles"

# Create ssh keys if private key does not exist
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then

    ssh-keygen -t ed25519 -C "skavya@vt.edu"
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519

    # Set proper permissions to SSH config file
    chmod 600 ~/.ssh/configs

    # Symlink SSH config file
    ln -sf "$DOTFILES/ssh/config" "$HOME/.ssh/config"

    # Print new public key
    echo "Public key: $(cat $HOME/.ssh/id_ed25519.pub)"

    # todo: publish public key to github account
else
    echo "SSH private key already exists"
fi
