{
  description = "Modular NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, catppuccin, home-manager, zen-browser, ... } @ inputs:
  let
    system = "x86_64-linux";

    # Function to create a NixOS configuration for a specific host
    mkHost = { hostname, system ? "x86_64-linux" }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          # Import the host-specific configuration
          ./hosts/${hostname}

          # Home Manager configuration
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "HMBackup";
            home-manager.useUserPackages = true;
            home-manager.users.quiet.imports = [
              ./hosts/${hostname}/home.nix
              catppuccin.homeModules.catppuccin
            ];
            home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
          }
        ];
      };

    # Function to create a default configuration based on the current hostname
    mkDefaultHost = { defaultSystem ? "x86_64-linux" }:
      let
        # Read the current hostname from /etc/hostname
        hostname = builtins.readFile "/etc/hostname";
        # Remove any trailing newlines
        cleanHostname = builtins.replaceStrings ["\n"] [""] hostname;
      in
        mkHost {
          hostname = cleanHostname;
          system = defaultSystem;
        };
  in {
    # Define NixOS configurations for each host
    nixosConfigurations = {
      # Current laptop configuration
      nixchan = mkHost {
        hostname = "nixchan";
        system = "x86_64-linux";
      };

      # Desktop configuration for hina (AMD 7700 + NVIDIA 4070)
      hina = mkHost {
        hostname = "hina";
        system = "x86_64-linux";
      };

      # Default configuration that automatically detects the hostname
      # This allows running 'nixos-rebuild switch' without specifying a hostname
      default = mkDefaultHost {
        defaultSystem = "x86_64-linux";
      };
    };
  };
}
