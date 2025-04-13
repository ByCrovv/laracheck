#!/bin/bash

SCRIPT_URL="https://raw.githubusercontent.com/YOUR_USERNAME/laravel-update-checker/main/check.sh"
INSTALL_PATH="$HOME/.laravel-check-update"

curl -s "$SCRIPT_URL" -o "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

RC_FILE="$HOME/.bashrc"
[ -n "$ZSH_VERSION" ] && RC_FILE="$HOME/.zshrc"

if ! grep -q "laravel-check-update" "$RC_FILE"; then
  echo -e "\n# Laravel installer update checker" >> "$RC_FILE"
  echo "$INSTALL_PATH" >> "$RC_FILE"
fi

echo "✅ Laravel update checker installed. Restart your terminal or run 'source $RC_FILE'."
