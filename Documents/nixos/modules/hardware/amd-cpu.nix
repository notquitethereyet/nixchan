# AMD CPU configuration
{ config, lib, pkgs, ... }:

{
  # Enable AMD microcode updates
  hardware.cpu.amd.updateMicrocode = true;
  
  # Load AMD-specific kernel modules
  boot.kernelModules = [ "kvm-amd" ];
  
  # Enable AMD-specific power management
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  
  # AMD-specific packages
  environment.systemPackages = with pkgs; [
    # CPU monitoring and management
    ryzen-monitor
    zenmonitor
    zenpower
    
    # General system monitoring
    lm_sensors
  ];
  
  # Enable thermald for better thermal management
  services.thermald.enable = true;
}
