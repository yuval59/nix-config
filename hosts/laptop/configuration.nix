# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ../default.nix # Include defaults

      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./aliases.nix # Include custom aliases
    ];

  networking.hostName = "Yuvals_Laptop"; # Define your hostname.

  # Mount Storage Partition
  fileSystems."/Storage" = { 
    device = "/dev/disk/by-uuid/944b0c79-ee8d-4be3-ab5c-f458fb479313";
    fsType = "ext4";
  };
}
