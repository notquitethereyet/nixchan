# Communication applications
{ config, lib, pkgs, ... }:

{
  # Communication-related packages
  environment.systemPackages = with pkgs; [
    # Discord client
    vesktop  # Third-party Discord client with enhanced features
    
    # Other messaging apps can be added here
    # telegram-desktop
    # element-desktop
    # signal-desktop
    
    # Video conferencing
    # zoom-us
    # jitsi
  ];
}
