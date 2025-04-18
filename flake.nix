{
  description = "Nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop/configuration.nix # Host Configuration
          ./modules/plasma6_wayland.nix # Desktop Environment
          ./modules/nvidia/proprietary.nix # NVIDIA drivers
          ./globals.nix # Default Modules
          ./modules/syncthing.nix # Syncthing
          ./modules/openrgb.nix # OpenRGB Installation
          ./modules/gaming.nix # Gaming Apps
          ./modules/piper.nix # Literally just LG mouse control
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/laptop/configuration.nix # Host Configuration
          ./modules/plasma6_wayland.nix # Desktop Environment
          ./globals.nix # Default Modules
          ./modules/syncthing.nix # Syncthing
          ./modules/bluetooth.nix # Enable Bluetooth
        ];
      };
    };
  };
}
