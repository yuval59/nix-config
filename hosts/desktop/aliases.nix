{ config, pkgs, ... }:

{
  # Custom aliases
  environment.interactiveShellInit = ''
    alias edit-nix="code ~/Nix"
    alias e="edit-nix"

    alias rebuild-update="sudo nixos-rebuild switch --recreate-lock-file --flake /Storage/Nix/#desktop"
    alias rr="rebuild-update"
    alias ru="rebuild-update"

    alias rebuild="sudo nixos-rebuild switch --flake /Storage/Nix/#desktop"
    alias r="rebuild"
    alias ro="rebuild"

    alias cs="code /Storage/CS2\ Config"

    alias hypr="code ~/.config/hypr"
  '';
}