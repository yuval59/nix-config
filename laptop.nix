{ pkgs, ... }:

{
    imports = [
        ./hosts/laptop/configuration.nix # Host Configuration
        ./modules/plasma6_wayland.nix # Desktop Environment
        ./globals.nix # Default Modules
        ./modules/syncthing.nix # Syncthing
        ./modules/bluetooth.nix # Enable Bluetooth
    ];
}