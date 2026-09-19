{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        libratbag # The actual interfacing library
        piper # LG mice moment
        solaar # LG mice moment 2
    ];

    services.ratbagd.enable = true;
}