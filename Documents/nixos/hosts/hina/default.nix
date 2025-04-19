# Configuration for the hina desktop (AMD 7700 + NVIDIA 4070)
{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    # Include hardware configuration (will need to be generated when setting up the PC)
    ./hardware-configuration.nix

    # Include common host configuration
    ../common

    # Include profiles
    ../../profiles/desktop.nix
    ../../profiles/development.nix

    # Include hardware-specific modules
    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/amd-cpu.nix

    # Include specific desktop environments/window managers
    ../../modules/desktop/hyprland.nix

    # Include services
    ../../modules/services/network.nix
    ../../modules/services/gaming.nix
  ];

  # Host-specific settings
  networking.hostName = "hina";

  # Use the latest kernel for better hardware support
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Desktop-specific packages
  environment.systemPackages = with pkgs; [
    # Desktop utilities
  ];

  # Note: The following packages are already included in other modules:
  # - steam, lutris, mangohud, gamemode, protonup-qt: Already in modules/services/gaming.nix
  # - spotify, vlc, mpv: Now in modules/desktop/media.nix
  # - vesktop (Discord client): Now in modules/desktop/communication.nix
  # - libreoffice-still: Now in modules/desktop/office.nix
  # - btop: Already in modules/core/default.nix
  # - Development tools (git, gcc, vscode, etc.): In modules/development/ modules
  # - windsurf: Now in modules/development/default.nix

  # Enable Steam hardware acceleration
  hardware.steam-hardware.enable = true;

  # Enable Vulkan support
  hardware.graphics.enable = true;

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Additional Wayland-specific settings
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    wlr.enable = false; # Disable wlr portal in favor of the Hyprland one
  };

  # Enable automatic system updates
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    flake = "/home/quiet/Documents/nixos";
    flags = [ "--update-input" "nixpkgs" "--commit-lock-file" ];
  };

  # Enable automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
