# Hardware configuration for hina desktop (AMD 7700 + NVIDIA 4070)
# This file should be generated when setting up the PC using nixos-generate-config
# and then customized as needed.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  # This is a placeholder. The actual hardware configuration will be generated
  # when setting up the PC using nixos-generate-config.
  # Below are some common settings you might want to adjust after generation.

  # Likely kernel modules for AMD + NVIDIA system
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # Example filesystem configuration (adjust UUIDs after generation)
  # fileSystems."/" =
  #   { device = "/dev/disk/by-uuid/REPLACE-WITH-ACTUAL-UUID";
  #     fsType = "ext4";
  #   };
  #
  # fileSystems."/boot" =
  #   { device = "/dev/disk/by-uuid/REPLACE-WITH-ACTUAL-UUID";
  #     fsType = "vfat";
  #   };
  #
  # swapDevices =
  #   [ { device = "/dev/disk/by-uuid/REPLACE-WITH-ACTUAL-UUID"; } ];

  # Enable DHCP by default
  networking.useDHCP = lib.mkDefault true;

  # Set platform to x86_64-linux
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
