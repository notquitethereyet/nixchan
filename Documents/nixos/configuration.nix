# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  # Storage Optimization
  nix.settings.auto-optimise-store = true;


  # Set your time zone.
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  ## Yet another nix helper
  programs.nh = {
  	enable = true;
  	clean.enable = true;
  	# flake = "/home/quiet/Documents/nixos/";
  	clean.extraArgs = "--keep-since 7d --keep 10";
  };

  environment.sessionVariables = {
  	FLAKE = "/home/quiet/Documents/nixos";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # Install firefox.
  programs.firefox.enable = true;
  

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # environment.systemPackages = with pkgs; import ./packages.nix { inherit pkgs; };


  # environment.systemPackages = with pkgs; 
  #   (import ./packages.nix { inherit pkgs; }) ++ 
  #   (import ./dev.nix { inherit pkgs; }) ++
  #   [
  #     (import ./python.nix { inherit pkgs; }).pythonEnv
  #   ];






  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
