{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        libratbag # The actual interfacing library
        piper # LG mice moment
    ];
}