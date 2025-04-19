{ config, lib, pkgs, ... }:

{
  # Enable Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Enable GameMode for better gaming performance
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
        softrealtime = "auto";
        inhibit_screensaver = 1;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        amd_performance_level = "high";
      };
    };
  };

  # Enable hardware acceleration for Steam
  hardware.steam-hardware.enable = true;

  # Enable Vulkan support
  hardware.graphics.enable32Bit = true;

  # Gaming-related packages
  environment.systemPackages = with pkgs; [
    # Steam and Proton tools
    steam
    protonup-qt
    gamescope

    # Performance monitoring and optimization
    mangohud
    goverlay

    # Game launchers
    lutris
    heroic
    bottles
    # prismlauncher # Minecraft launcher

    # Emulators
    # retroarch
  ];

  # Open required ports for gaming
  networking.firewall = {
    # Steam
    allowedTCPPorts = [ 27036 27037 ];
    allowedUDPPorts = [ 27031 27036 ];
  };
}
