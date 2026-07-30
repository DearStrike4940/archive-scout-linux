#!/bin/bash
set -euo pipefail
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
rm -rf "$DATA_HOME/archive-scout"
rm -f "$DATA_HOME/applications/archive-scout.desktop"
rm -f "$HOME/.local/bin/archive-scout"
command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$DATA_HOME/applications" || true
echo "Archive Scout removed. Project output folders were left untouched."
