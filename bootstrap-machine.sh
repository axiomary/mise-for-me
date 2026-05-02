#!/bin/bash


if ! command -v mise &> /dev/null; then
    echo "Error: 'mise' is not installed."
    echo "Please install mise before running this bootstrap script."
    echo "Installation guide: https://mise.jdx.dev/getting-started.html"
    exit 1
fi

mkdir -p ~/.config/mise
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ln -sf "$REPO_DIR/config.toml" ~/.config/mise/config.toml
mise install

HK_ALIAS="alias hk='mise exec -- hk'"
if ! grep -q "$HK_ALIAS" ~/.zshrc; then
    echo "$HK_ALIAS" >> ~/.zshrc
    echo "Alias 'hk' added to ~/.zshrc"
else
    echo "Alias 'hk' already exists in ~/.zshrc"
fi


echo "Mise global config linked and tools installed! Restart your terminal or run 'source ~/.zshrc'"
