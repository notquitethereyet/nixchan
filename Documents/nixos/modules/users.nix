{ config, pkgs, ... }:

{
  users.users.quiet = {
    isNormalUser = true;
    description = "quiet";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
