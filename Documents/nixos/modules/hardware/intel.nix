# Intel CPU and integrated graphics configuration
{ config, lib, pkgs, ... }:

{
  # Enable Intel microcode updates
  hardware.cpu.intel.updateMicrocode = true;

  # Load Intel-specific kernel modules
  boot.kernelModules = [ "kvm-intel" ];

  # Enable Intel graphics support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver    # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver    # LIBVA_DRIVER_NAME=i965 (older but works better for some applications)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Power management for Intel CPUs
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  services.thermald.enable = true;

  # Intel-specific packages
  environment.systemPackages = with pkgs; [
    # CPU monitoring and management
    intel-gpu-tools
    lm_sensors
    powertop

    # ThinkPad-specific tools (if applicable)
    acpi
    tlp
  ];

  # Enable TLP for better battery life on laptops
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # Set the CPU energy/performance policies
      ENERGY_PERF_POLICY_ON_AC = "performance";
      ENERGY_PERF_POLICY_ON_BAT = "power";

      # Disable the integrated graphics power management
      INTEL_GPU_MIN_FREQ_ON_AC = 0;
      INTEL_GPU_MIN_FREQ_ON_BAT = 0;
      INTEL_GPU_MAX_FREQ_ON_AC = 0;
      INTEL_GPU_MAX_FREQ_ON_BAT = 0;
      INTEL_GPU_BOOST_FREQ_ON_AC = 0;
      INTEL_GPU_BOOST_FREQ_ON_BAT = 0;
    };
  };

  # Environment variables for Intel graphics
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD"; # Use intel-media-driver
    VDPAU_DRIVER = "va_gl"; # Use VDPAU over VAAPI
  };
}
