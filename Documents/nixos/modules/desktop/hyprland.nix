# Hyprland window manager configuration
# This module only installs Hyprland and related packages
# but does not manage the Hyprland configuration
{ inputs, config, lib, pkgs, ... }:

{
  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      #"https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      #"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    # Do not manage the Hyprland configuration
    # The user will manage their own configuration
  };

  environment.sessionVariables = {
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  # Enable XDG Desktop Portal for proper application integration
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    wlr.enable = false; # Disable wlr portal in favor of the Hyprland one
  };

  # Ensure proper services are running for Hyprland
  security.polkit.enable = true;

  # Hyprland-specific packages
  environment.systemPackages = with pkgs; [
    waypaper
    rofi-wayland
    waybar
    swww
    mako
    grim
    grimblast
    swappy
    cliphist
    wofi
    hyprlock
    wlogout
    hyprutils
    nwg-look
    slurp
  ];
}
