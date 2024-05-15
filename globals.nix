{ pkgs, ... }:

{
    imports = [
        ./modules/audio.nix
        ./modules/syncthing.nix
        ./modules/socials.nix
        ./modules/utils.nix
        ./modules/coding.nix
        ./modules/media.nix
        ./modules/productivity.nix
    ];
}