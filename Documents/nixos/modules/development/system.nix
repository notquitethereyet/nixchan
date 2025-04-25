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


  # direnv is a tool for managing environment variables in a .envrc file

  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    silent = false;
    loadInNixShell = true;
    direnvrcExtra = "";
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
};

}
