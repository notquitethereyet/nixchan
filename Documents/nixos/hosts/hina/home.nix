# Home configuration for hina desktop
{ config, pkgs, system, inputs, ... }:

{
  home.username = "quiet";
  home.homeDirectory = "/home/quiet";

  imports = [
    # Import the same zsh configuration as nixchan
    ../nixchan/zsh.nix
  ];

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    # Archive tools
    zip
    xz
    unzip
    p7zip

    # Shell enhancements
    zplug
    oh-my-posh

    # Browser
    inputs.zen-browser.packages."${system}".default

    # Communication
    telegram-desktop
  ];

  # Note: The following packages are already included in system modules:
  # - vscode: Already in modules/development/default.nix
  # - vlc, mpv: Now in modules/desktop/media.nix
  # - vesktop (Discord client): Now in modules/desktop/communication.nix
  # - prismlauncher: Already in modules/services/gaming.nix

  # Git configuration
  programs.git = {
    enable = true;
    userName = "quiet";
    userEmail = "quiet@example.com"; # Replace with your actual email
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Catppuccin theme
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  # State version
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
