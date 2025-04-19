# Minimal system profile with just the essentials
{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules/core
  ];
  
  # Any minimal-specific configurations can go here
}
