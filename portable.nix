{ pkgs, modulesPath, lib, ... }: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ./hosts/portable/configuration.nix # Host configuration
    ./globals.nix # All the defaults
    ./modules/bluetooth.nix # Bluetooth support just in case
    ./modules/nvidia/proprietary.nix # Nvidia proprietary drivers
    ./modules/gaming.nix # GAMING babyyy
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # use the latest Linux kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Needed for https://github.com/NixOS/nixpkgs/issues/58959
  boot.supportedFilesystems = lib.mkForce [ "btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" ];
}