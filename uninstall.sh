#!/usr/bin/env bash

INSTALL_DIR="$HOME/.local/share/Fastfetch-Pokemon"

rm -rf "$INSTALL_DIR"

rm -f "$HOME/.cache/pokemon_name.txt"

sed -i '/# FASTFETCH_POKEMON_START/,/# FASTFETCH_POKEMON_END/d' "$HOME/.bashrc"

echo "Fastfetch-Pokemon removed."
echo "Run: source ~/.bashrc"
