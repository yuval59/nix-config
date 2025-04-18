{ pkgs, ... }:

{
    imports = [
        ./modules/audio.nix
        ./modules/socials.nix
        ./modules/utils.nix
        ./modules/coding.nix
        ./modules/media.nix
        ./modules/productivity.nix
        ./modules/misc.nix
    ];
}