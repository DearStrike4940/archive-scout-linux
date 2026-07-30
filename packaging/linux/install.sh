#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
BIN_HOME="${HOME}/.local/bin"
APP_HOME="$DATA_HOME/archive-scout"
DESKTOP_HOME="$DATA_HOME/applications"
rm -rf "$APP_HOME"
mkdir -p "$APP_HOME" "$BIN_HOME" "$DESKTOP_HOME"
cp -R "$ROOT/Archive Scout" "$APP_HOME/app"
cat > "$BIN_HOME/archive-scout" <<EOF
#!/bin/bash
exec "$APP_HOME/app/archive-scout" "\$@"
EOF
chmod +x "$BIN_HOME/archive-scout"
cat > "$DESKTOP_HOME/archive-scout.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Archive Scout
Comment=Search and scan public Wayback Machine captures
Exec=$BIN_HOME/archive-scout
Terminal=false
Categories=Network;Utility;
EOF
chmod +x "$DESKTOP_HOME/archive-scout.desktop"
cp "$ROOT/uninstall.sh" "$APP_HOME/uninstall.sh"
chmod +x "$APP_HOME/uninstall.sh"
command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$DESKTOP_HOME" || true
echo "Archive Scout installed. Run: $BIN_HOME/archive-scout"
"$BIN_HOME/archive-scout" >/dev/null 2>&1 &
