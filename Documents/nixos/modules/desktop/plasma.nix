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
  
  # Additional KDE-specific packages
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    # Add other KDE-specific packages here
  ];
}
