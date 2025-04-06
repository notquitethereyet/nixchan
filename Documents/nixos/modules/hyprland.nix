{ inputs, config, pkgs, ... }:
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

  # Fix potential mesa version mismatch issues
  # Using the new hardware.graphics options instead of hardware.opengl
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Ensure proper services are running for Hyprland
  security.polkit.enable = true;
  
  # Removed fonts.enableDefaultPackages to avoid conflict with fonts.nix
}