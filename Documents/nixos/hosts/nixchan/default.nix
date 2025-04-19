# Configuration for the nixchan host (Intel ThinkPad laptop)
{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    # Include hardware configuration
    ./hardware-configuration.nix

    # Include common host configuration
    ../common

    # Include profiles
    ../../profiles/desktop.nix
    ../../profiles/development.nix

    # Include hardware-specific modules
    ../../modules/hardware/intel.nix

    # Include specific desktop environments/window managers
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/plasma.nix

    # Include services
    ../../modules/services/network.nix
    # ../../modules/services/gaming.nix
  ];

  # Host-specific settings
  networking.hostName = "nixchan";

  # ThinkPad-specific settings
  services.throttled.enable = lib.mkDefault true; # Throttling fix for ThinkPads

  # Enable fingerprint reader (if available)
  services.fprintd.enable = lib.mkDefault true;

  # Enable better power management for laptops
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;

  # Optimize for battery life
  services.tlp.enable = true;

  # Disable power-profiles-daemon as it conflicts with TLP
  services.power-profiles-daemon.enable = false;

  # Touchpad settings
  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      disableWhileTyping = true;
    };
  };

  # Any other nixchan-specific configurations
  environment.systemPackages = with pkgs; [

  ];

  # Note: The following packages are already included in other modules:
  # - spotify: Now in modules/desktop/media.nix
  # - vesktop (Discord client): Now in modules/desktop/communication.nix
  # - libreoffice-still: Now in modules/desktop/office.nix
  # - acpi, powertop, tlp: Already in modules/hardware/intel.nix
  # - Development tools (git, gcc, vscode, etc.): In modules/development/ modules
  # - windsurf: Now in modules/development/default.nix
}
