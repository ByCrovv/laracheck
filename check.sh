#!/bin/bash

if ! command -v laravel &> /dev/null; then
  echo "Laravel installer not found. Please install it using:"
  echo "composer global require laravel/installer"
  exit 1
fi

current_version=$(laravel --version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
latest_version=$(curl -s https://repo.packagist.org/p2/laravel/installer.json | grep -oP '"version":\s*"\K[0-9]+\.[0-9]+\.[0-9]+' | head -1)

if [ "$current_version" != "$latest_version" ]; then
  echo -e "\033[1;33m⚠️  Laravel installer is outdated."
  echo -e "Current: $current_version"
  echo -e "Latest:  $latest_version\033[0m"
  echo -e "Update it with: \033[1;32mcomposer global require laravel/installer\033[0m"
fi
