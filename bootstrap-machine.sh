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

HK_CMD="export HK_MISE=1"
if ! grep -q "$HK_CMD" ~/.zshrc; then
    echo "$HK_CMD" >> ~/.zshrc
    echo "HK_MISE set in /.zshrc"
else
    echo "HK_MISE already exists in ~/.zshrc"
fi


echo "Mise global config linked and tools installed! Restart your terminal or run 'source ~/.zshrc'"
