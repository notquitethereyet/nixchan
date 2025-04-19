# Development system profile
{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules/core
    ../modules/development
  ];
  
  # Any development-specific configurations can go here
}
