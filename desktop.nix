{ pkgs, ... }:

{
    imports = [
        ./hosts/desktop/configuration.nix # Host Configuration
        ./modules/plasma6_wayland.nix # Desktop Environment
        ./modules/nvidia/proprietary.nix # NVIDIA drivers
        ./globals.nix # Default Modules
        ./modules/syncthing.nix # Syncthing
        ./modules/openrgb.nix # OpenRGB Installation
        ./modules/virtualization.nix # VMs and such
        ./modules/gaming.nix # Gaming Apps
        ./modules/piper.nix # Literally just LG mouse control
        ./modules/electronics.nix # Stuff for electronics

        ./modules/work/vpn.nix # OpenFortiVPN for work

        ./modules/warp.nix # Warp ADE
        {
        programs.warp-ade.enable = true;
        programs.warp-ade.sha256 = "sha256-V0JuOzFqmQz96CkSvtPyYWjQpa/94LQOuS2hw4PwGDI=";
        # optional customization:
        # programs.warp-ade.version = "2025-09-19";
        }
    ];
}