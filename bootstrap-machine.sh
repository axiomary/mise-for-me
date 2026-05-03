#!/bin/bash

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_CONFIG_DIR="$REPO_DIR/config/mise/conf.d"

if ! command -v mise &> /dev/null; then
    echo "Error: 'mise' is not installed."
    echo "Please install mise before running this bootstrap script."
    echo "Installation guide: https://mise.jdx.dev/getting-started.html"
    exit 1
fi

mkdir -p ~/.config
ln -sfn "$SOURCE_CONFIG_DIR" ~/.config/mise/conf.d

echo "Linked $SOURCE_CONFIG_DIR to ~/.config/mise"
mise install

HK_CMD="export HK_MISE=1"
if ! grep -q "$HK_CMD" ~/.zshrc; then
    echo "$HK_CMD" >> ~/.zshrc
    echo "HK_MISE set in /.zshrc"
else
    echo "HK_MISE already exists in ~/.zshrc"
fi


echo "Mise global config linked and tools installed! Restart your terminal or run 'source ~/.zshrc'"
