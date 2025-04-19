# Dotfile management tools and settings
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Chezmoi for dotfile management
    chezmoi
    
    # Other dotfile management tools
    # stow
    # yadm
  ];
  
  # Documentation for chezmoi
  environment.variables = {
    CHEZMOI_DOCS = "https://www.chezmoi.io/user-guide/command-overview/";
  };
}
