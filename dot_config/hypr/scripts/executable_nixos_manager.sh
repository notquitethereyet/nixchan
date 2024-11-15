#!/usr/bin/env bash

# Function to handle the NixOS rebuild
nixos_rebuild() {
  currentdir=$(pwd)
  cd /home/quiet/Documents/nixos/
  # git add .
  # git commit -m "rebuild"
  sudo nixos-rebuild switch
  # git push
  cd $currentdir
}

# Function to handle the NixOS update and rebuild
nixos_update_and_rebuild() {
  currentdir=$(pwd)
  cd /home/quiet/Documents/nixos/
  nix flake update
  # git add .
  # git commit -m "update and rebuild"
  sudo nixos-rebuild switch
  # git push
  cd $currentdir
}

# Function to handle the NixOS garbage collection
nixos_gc() {
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system
  sudo nix-store --gc
}

# Check the argument passed to the script
case "$1" in
  rebuild)
    echo "Running NixOS rebuild..."
    nixos_rebuild
    ;;
  update)
    echo "Running NixOS update and rebuild..."
    nixos_update_and_rebuild
    ;;
  gc)
    echo "Running NixOS garbage collection..."
    nixos_gc
    ;;
  *)
    echo "Usage: $0 {rebuild|update_and_rebuild|gc}"
    exit 1
    ;;
esac
