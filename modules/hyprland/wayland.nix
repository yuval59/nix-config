{ pkgs, ... }:

{    
    imports = [
        ./utils.nix
    ];

    security.polkit.enable = true;

    # Hint Electron apps to use Wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # Screen Sharing
    services.dbus.enable = true;
    xdg.portal = {
        enable = true;
        wlr.enable = true;
        extraPortals = [
            pkgs.xdg-desktop-portal-gtk
        ];
    };  

    # Enable Hyprland
    programs.hyprland = {
        enable = true; 
        xwayland.enable = true;
    };
    
    # Fixing a bug with Waybar not displaying Hyprland workspaces
    # nixpkgs.overlays = [
    #     (self: super: {
    #         waybar = super.waybar.overrideAttrs (oldAttrs: {
    #             mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    #         });
    #     })
    # ];
}