#!/bin/bash

packages=("hyprland", "fastfetch", "kitty", "wbg", "nvim", "thunar", "waybar", "wofi", "cava", "hyprshot", "hypridle")

detect_package_manager() {
  echo Installing required packages..

  if command -v apt &>/dev/null; then
    sudo apt update
    sudo apt install -y "${packages[@]}"
  elif command -v dnf &>/dev/null; then
    sudo dnf install -y "${packages[@]}"
  elif command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm "${packages[@]}"
  else
    echo "Unsupported package manager or distribution."
    exit 1
  fi
}

detect_package_manager

echo Copying files...
cp -r .config ~/
