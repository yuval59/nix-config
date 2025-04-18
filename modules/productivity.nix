{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        obsidian # Obsidian
        libreoffice-still # Office shit
    ];
}