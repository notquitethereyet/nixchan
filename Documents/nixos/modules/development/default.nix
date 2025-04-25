# Common development tools and settings
{ config, lib, pkgs, ... }:

{
  # Common development tools that are useful across different development environments
  environment.systemPackages = with pkgs; [
    # Version control
    git
    lazygit

    # Editors
    vscode

    # Build tools
    gcc

    # Environment management
    direnv

    # Productivity
    windsurf
  ];

  # Import specialized development environments
  imports = [
    ./web.nix
    ./python.nix
    ./system.nix
    ./dotfiles.nix
  ];
}
