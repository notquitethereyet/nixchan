# NVIDIA GPU configuration
{ config, lib, pkgs, ... }:

{
  # Enable graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Load NVIDIA driver
  services.xserver.videoDrivers = ["nvidia"];

  # NVIDIA settings
  hardware.nvidia = {
    # Modesetting is required for Wayland
    modesetting.enable = true;

    # Enable the NVIDIA settings menu
    nvidiaSettings = true;

    # Enable the proprietary NVIDIA drivers
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Force full composition pipeline for better performance
    forceFullCompositionPipeline = true;

    # Power management
    powerManagement = {
      enable = true;
      finegrained = true;
    };

    # Open source drivers - set to false to use proprietary drivers
    open = false;

    # Enable DRM kernel mode setting
    # This is needed for Wayland compositors
    nvidiaPersistenced = true;
  };

  # Boot configuration for NVIDIA
  boot = {
    # Kernel parameters for NVIDIA
    kernelParams = [
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      "nvidia.NVreg_TemporaryFilePath=/var/tmp"
      "nvidia_drm.modeset=1"
    ];

    # Load NVIDIA drivers early in the boot process
    initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

    # Blacklist nouveau (open-source NVIDIA driver)
    blacklistedKernelModules = [ "nouveau" ];
  };

  # Environment variables for NVIDIA + Wayland
  environment.sessionVariables = {
    # NVIDIA-specific variables for Wayland
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # NVIDIA-related packages
  environment.systemPackages = with pkgs; [
    # NVIDIA utilities
    nvtop
    nvidia-vaapi-driver
    libva
  ];
}
