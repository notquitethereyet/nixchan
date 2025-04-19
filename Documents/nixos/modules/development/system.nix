# System programming tools and settings
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # C/C++ development
    gcc
    gnumake
    
    # System utilities
    gdb
    
    # Add other system programming tools here as needed
  ];
}
