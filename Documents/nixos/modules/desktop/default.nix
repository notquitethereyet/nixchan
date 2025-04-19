# Common desktop environment settings
{ config, lib, pkgs, ... }:

{
  # Import desktop-related modules
  imports = [
    ./media.nix
    ./communication.nix
    ./office.nix
  ];
  # Common desktop-related services
  services = {
    # Enable CUPS for printing
    printing.enable = true;

    # Enable sound with pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # Disable PulseAudio in favor of PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Common desktop packages
  environment.systemPackages = with pkgs; [
    # Terminal emulators
    kitty
    alacritty

    # System utilities
    fastfetch
    brightnessctl
    pavucontrol

    # File management
    gnome-icon-theme

    # Notifications
    libnotify

    # Clipboard management
    wl-clipboard

    # Browser
    firefox
  ];

  # Note: Media packages have been moved to modules/desktop/media.nix

  # Enable Firefox by default
  programs.firefox.enable = true;

  # Enable dconf for GNOME/GTK application settings
  programs.dconf.enable = true;

  # Hardware acceleration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Bluetooth support
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}
