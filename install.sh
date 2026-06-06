#!/usr/bin/env bash

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==================================="
echo " Fastfetch-Pokemon Installer"
echo "==================================="

# -----------------------------
# Check dependencies
# -----------------------------

if ! command -v fastfetch >/dev/null 2>&1; then
    echo "[ERROR] fastfetch is not installed."

    if command -v pacman >/dev/null 2>&1; then
        echo "Install with:"
        echo "sudo pacman -S fastfetch"
    elif command -v apt >/dev/null 2>&1; then
        echo "Install with:"
        echo "sudo apt install fastfetch"
    fi

    exit 1
fi

if ! command -v python3 >/dev/null 2>&1; then
    echo "[ERROR] python3 is required."
    exit 1
fi

# -----------------------------
# Install location
# -----------------------------

INSTALL_DIR="$HOME/.local/share/Fastfetch-Pokemon"

echo "[*] Installing to:"
echo "    $INSTALL_DIR"

rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

cp -r \
    "$REPO_DIR/images" \
    "$REPO_DIR/fastfetch" \
    "$REPO_DIR/random_pokemon.py" \
    "$REPO_DIR/namelist.txt" \
    "$REPO_DIR/pokimg" \
    "$INSTALL_DIR"

chmod +x "$INSTALL_DIR/pokimg"

# -----------------------------
# Fastfetch config
# -----------------------------

mkdir -p "$HOME/.config/fastfetch"

if [ -f "$HOME/.config/fastfetch/config.jsonc" ]; then
    cp \
        "$HOME/.config/fastfetch/config.jsonc" \
        "$HOME/.config/fastfetch/config.jsonc.bak"

    echo "[*] Existing config backed up."
fi

cp "$REPO_DIR"/fastfetch/* "$HOME/.config/fastfetch/"

# -----------------------------
# Create launcher
# -----------------------------

cat > "$INSTALL_DIR/run.sh" << EOF
#!/usr/bin/env bash

BASE_DIR="$INSTALL_DIR"

OUTPUT=\$(python3 "\$BASE_DIR/random_pokemon.py")

POKEMON=\$(echo "\$OUTPUT" | awk '{print \$1}')

mkdir -p "\$HOME/.cache"

echo "\$POKEMON" > "\$HOME/.cache/pokemon_name.txt"

fastfetch \
    --logo "\$BASE_DIR/images/\${POKEMON}.png" \
    --logo-type kitty-direct \
    --logo-width 30 \
    --logo-height 15 \
    --config "\$HOME/.config/fastfetch/config.jsonc"
EOF

chmod +x "$INSTALL_DIR/run.sh"

# -----------------------------
# Bashrc integration
# -----------------------------

START_MARK="# FASTFETCH_POKEMON_START"
END_MARK="# FASTFETCH_POKEMON_END"

if ! grep -q "$START_MARK" "$HOME/.bashrc"; then

cat >> "$HOME/.bashrc" << EOF

$START_MARK
if [[ \$- == *i* ]]; then
    "$INSTALL_DIR/run.sh"
fi
$END_MARK

EOF

echo "[*] Added to .bashrc"
else
    echo "[*] .bashrc already configured"
fi

echo
echo "Installation complete!"
echo
echo "Restart terminal or run:"
echo
echo "source ~/.bashrc"
