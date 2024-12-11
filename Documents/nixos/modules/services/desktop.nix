{ config, pkgs, ... }:

{
  services = {

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    # displayManager.sddm.catppuccin = {
    #   enable = true;
    # };
    displayManager.sddm.settings = {
      General = {
        InputMethod = "";
      };
    };
  };

  programs.dconf.enable = true;
}
