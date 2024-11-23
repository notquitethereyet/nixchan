#!/usr/bin/env sh

# List of files and directories to add to chezmoi
files=(
    "/home/quiet/Documents/nixos"
    "/home/quiet/.face.icon"
    "/home/quiet/.weatherapikey"
    "/home/quiet/vesktop.json"
    "/home/quiet/.config/fastfetch"
    "/home/quiet/.config/kitty"
    "/home/quiet/.config/hypr"
    "/home/quiet/.config/ohmyposh"
    "/home/quiet/.config/rofi"
    "/home/quiet/.config/wofi"
    "/home/quiet/.local/share/rofi"
    "/home/quiet/.config/waybar"
    "/home/quiet/.config/waypaper"
    "/home/quiet/.config/wlogout"
    "/home/quiet/.config/mako"
    "/home/quiet/.config/electron-flags.conf"
    "/home/quiet/.config/qt5ct"
    "/home/quiet/.themes"
)

# Loop through the files and add each one to chezmoi
for file in "${files[@]}"; do
    chezmoi add "$file"
done
