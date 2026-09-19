{ config, pkgs, ... }:

{
  # Custom aliases
  environment.interactiveShellInit = ''
    alias edit-nix="code ~/Nix"
    alias e="edit-nix"

    alias rr="sudo nixos-rebuild switch --recreate-lock-file --flake /Storage/Nix/#laptop"
    alias rebuild-update="rr"
    alias ru="rr"

    alias r="sudo nixos-rebuild switch --flake /Storage/Nix/#laptop"
    alias rebuild="r"
    alias ro="r"
  '';
}