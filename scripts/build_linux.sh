#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
rm -rf build dist release package-root
mkdir -p release "package-root/ArchiveScout-Linux-x86_64"
python -m PyInstaller \
  --noconfirm \
  --clean \
  --windowed \
  --onedir \
  --collect-all truststore \
  --name "archive-scout" \
  run_app.py
mkdir -p "package-root/ArchiveScout-Linux-x86_64/Archive Scout"
cp -R dist/archive-scout/. "package-root/ArchiveScout-Linux-x86_64/Archive Scout/"
cp "packaging/linux/install.sh" "package-root/ArchiveScout-Linux-x86_64/"
cp "packaging/linux/uninstall.sh" "package-root/ArchiveScout-Linux-x86_64/"
cp "packaging/linux/Run Archive Scout.sh" "package-root/ArchiveScout-Linux-x86_64/"
chmod +x "package-root/ArchiveScout-Linux-x86_64/"*.sh
chmod +x "package-root/ArchiveScout-Linux-x86_64/Archive Scout/archive-scout"
tar -C package-root -czf release/ArchiveScout-Linux-x86_64.tar.gz ArchiveScout-Linux-x86_64
cd release
sha256sum ArchiveScout-Linux-x86_64.tar.gz > ArchiveScout-Linux-x86_64.tar.gz.sha256
