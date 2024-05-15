{ pkgs, ... }:

{
    imports = [
        ./greetd.nix
    ];
    
    programs.sway.enable = true;
    security.polkit.enable = true;

    # DO NOT USE

    # This Module is currently broken.
    # Need to switch to Nouveau Nvidia drivers for it to work.
}