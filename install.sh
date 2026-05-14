#!/data/data/com.termux/files/usr/bin/bash

set -e

APP_NAME="openvpn-renamer"
BIN_NAME="openrename"
INSTALL_DIR="$HOME/$APP_NAME"
BIN_PATH="$PREFIX/bin/$BIN_NAME"

echo ""
echo "===================================="
echo "   OpenVPN Renamer Installer"
echo "===================================="
echo ""

echo "[1/4] Checking Termux environment..."

if [ ! -d "$PREFIX" ]; then
    echo "This installer is for Termux only."
    exit 1
fi

echo "[2/4] Creating install directory..."
mkdir -p "$INSTALL_DIR"

echo "[3/4] Downloading files..."

# اگر ریپو کلون شده:
cp -f openvpn-renamer "$INSTALL_DIR/openvpn-renamer"

echo "[4/4] Setting permissions..."
chmod +x "$INSTALL_DIR/openvpn-renamer"

echo "Creating global command..."

# ساخت command global
cat > "$BIN_PATH" <<EOF
#!/data/data/com.termux/files/usr/bin/bash
exec "$INSTALL_DIR/openvpn-renamer" "\$@"
EOF

chmod +x "$BIN_PATH"

echo ""
echo "===================================="
echo " Installation Completed Successfully"
echo "===================================="
echo ""
echo "Now you can run the tool from anywhere:"
echo ""
echo "   $ openrename"
echo ""
echo "Folder installed at:"
echo "   $INSTALL_DIR"
echo ""
