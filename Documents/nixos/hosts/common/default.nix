# Common configuration for all hosts
{ config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/users.nix
  ];
  
  # Common host configurations that should apply to all hosts
  environment.sessionVariables = {
    FLAKE = "/home/quiet/Documents/nixos";
  };
}
