{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        arduino-ide
        arduino-core
    ];
}