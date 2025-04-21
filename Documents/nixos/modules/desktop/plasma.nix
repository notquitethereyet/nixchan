# KDE Plasma desktop environment configuration
{ config, lib, pkgs, ... }:

{
  services = {
    # Enable the X11 windowing system
    xserver.enable = true;

    # Enable SDDM display manager
    displayManager.sddm.enable = true;

    # Enable Plasma desktop
    desktopManager.plasma6.enable = true;

    # SDDM settings
    displayManager.sddm.settings = {
      General = {
        InputMethod = "";
      };
    };
  };

  # Enable XDG MIME and menu support
  xdg.mime.enable = true;
  xdg.menus.enable = true;

  # Fix for empty "Open With" menu in Dolphin when running under Hyprland
  # This copies the plasma-applications.menu file from plasma-workspace to /etc/xdg/menus/applications.menu
  environment.etc."/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  # Additional KDE-specific packages
  environment.systemPackages = with pkgs; [
    kdePackages.kate

    # Dolphin and required dependencies
    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kdf
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.kio-admin
    kdePackages.qtwayland
    kdePackages.plasma-integration
    kdePackages.kdegraphics-thumbnailers
    kdePackages.breeze-icons
    kdePackages.qtsvg
    kdePackages.kservice
    shared-mime-info
  ];
}
