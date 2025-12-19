#!/usr/bin/env bash
set -euo pipefail

echo "Running devcontainer post-create installs with persistent caches..."

if [ "$(id -u)" -ne 0 ]; then
  SUDO="sudo"
else
  SUDO=""
fi

echo "Updating apt and installing base packages..."
$SUDO apt-get update
$SUDO apt-get install -y --no-install-recommends git curl build-essential

if [ -f requirements.txt ]; then
  if command -v python3 >/dev/null 2>&1; then
    echo "Installing Python packages from requirements.txt using pip cache..."
    python3 -m pip install --upgrade pip setuptools wheel
    python3 -m pip install -r requirements.txt --cache-dir /home/vscode/.cache/pip || true
  else
    echo "python3 not found; skipping pip installs"
  fi
fi

if [ -f package.json ]; then
  if command -v npm >/dev/null 2>&1; then
    echo "Installing npm packages (will use /home/vscode/.npm volume for cache)..."
    npm install || true
  else
    echo "npm not found; skipping npm installs"
  fi
fi

echo "Devcontainer post-create completed."
