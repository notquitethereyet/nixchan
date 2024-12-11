{ config, pkgs, system, inputs, ... }:
# let
#   system = "x86_64-linux";
#  in
{
  # TODO please change the username & home directory to your own
  home.username = "quiet";
  home.homeDirectory = "/home/quiet";

  imports = [
    ./zsh.nix
  ];
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    zip
    xz
    unzip
    p7zip
    zplug
	  oh-my-posh
    inputs.zen-browser.packages."${system}".specific
  ];

  programs.git = {
    enable = true;
    userName = "notquitethereyet";
    userEmail = "arnav.panigrahi@gmail.com";
    extraConfig = {
        init.defaultBranch = "main";
    };
  };


  # Catpussy thing
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}