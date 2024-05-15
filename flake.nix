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
          ./modules/x11.nix # Desktop Environment
          ./modules/nvidia.nix # NVIDIA drivers
          ./globals.nix # Default Modules
          ./modules/openrgb.nix # OpenRGB Installation
          ./modules/gaming.nix # Gaming Apps
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/laptop/configuration.nix # Host Configuration
          ./modules/x11.nix # Desktop Environment
          ./globals.nix # Default Modules
        ];
      };
    };
  };
}
