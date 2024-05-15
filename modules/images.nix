{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        gimp # GIMP
    ]
}