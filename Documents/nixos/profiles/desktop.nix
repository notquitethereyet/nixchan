# Desktop system profile
{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules/core
    ../modules/desktop
    ../modules/fonts.nix
  ];
  
  # Any desktop-specific configurations can go here
}
