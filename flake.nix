{
  description = "Nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      portable = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          (nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
          ./hosts/portable/configuration.nix
          ./globals.nix
          ./modules/unigine.nix
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop/configuration.nix # Host Configuration
          ./modules/x11.nix # Desktop Environment
          ./modules/nvidia.nix # NVIDIA drivers
          ./globals.nix # Default Modules
          ./modules/openrgb.nix # OpenRGB Installation
          ./modules/gaming.nix # Gaming Apps
          ./modules/unigine.nix # GPU Stress Test
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
