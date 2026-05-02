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

echo "Mise global config linked and tools installed!"
