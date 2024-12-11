{ config, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    hostName = "nixchan";
  };
}
