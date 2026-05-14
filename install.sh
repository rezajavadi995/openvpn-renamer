#!/data/data/com.termux/files/usr/bin/bash

set -e

APP_NAME="openvpn-renamer"
BIN_NAME="openrename"
INSTALL_DIR="$HOME/$APP_NAME"
BIN_PATH="$PREFIX/bin/$BIN_NAME"

echo "===================================="
echo "   OpenVPN Renamer Installer"
echo "===================================="

echo "[1/5] Checking Termux..."
[ -d "$PREFIX" ] || { echo "Termux only"; exit 1; }

echo "[2/5] Creating install directory..."
mkdir -p "$INSTALL_DIR"

echo "[3/5] Cloning repository..."

if [ -d "$INSTALL_DIR/.git" ]; then
    rm -rf "$INSTALL_DIR"
fi

git clone https://github.com/rezajavadi995/openvpn-renamer.git "$INSTALL_DIR"

echo "[4/5] Setting permissions..."
chmod +x "$INSTALL_DIR/openvpn-renamer"

echo "[5/5] Creating command..."
cat > "$BIN_PATH" <<EOF
#!/data/data/com.termux/files/usr/bin/bash
exec "$INSTALL_DIR/openvpn-renamer" "\$@"
EOF

chmod +x "$BIN_PATH"

echo ""
echo "===================================="
echo " Installation Completed"
echo "===================================="
echo ""
echo "Run with:"
echo "   openrename"
echo ""
