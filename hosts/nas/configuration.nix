# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:

{
  imports =
    [ 
      ../default.nix # Include defaults

      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./aliases.nix # Include custom aliases
    ];

  networking.hostName = "Home_NAS"; # Define your hostname.

  # Mount Storage Partition
  fileSystems."/Storage" = { 
    device = "/dev/disk/by-uuid/e7bcfac3-e4b7-4543-a72d-400d0e6bac53";
    fsType = "ext4";
  };

  # Mount Home Partition
  fileSystems."/home" = { 
    device = "/dev/disk/by-uuid/edb40e3d-2806-434f-a49f-a826ac80d86a";
    fsType = "ext4";
  };
}
