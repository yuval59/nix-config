{ config, pkgs, ... }:

{
  # Custom aliases
  environment.interactiveShellInit = ''
    alias edit-nix="code ~/Nix"
    alias update-flake="sudo nix flake update --flake /Storage/Nix"
    alias rebuild-laptop="sudo nixos-rebuild switch --flake /Storage/Nix/#laptop"

    alias e="edit-nix"
    alias uf="update-flake"
    alias r="rebuild-laptop"
    alias rr="update-flake & rebuild-laptop"
  '';
}