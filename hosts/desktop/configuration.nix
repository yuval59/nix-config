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

  networking.hostName = "Yuvals_PC"; # Define your hostname.

  # Mount Storage SSD
  fileSystems."/Storage" = { 
    device = "/dev/disk/by-uuid/e7bcfac3-e4b7-4543-a72d-400d0e6bac53";
    fsType = "ext4";
  };
}
