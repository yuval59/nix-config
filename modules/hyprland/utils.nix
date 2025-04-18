{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        hyprland # 
        xwayland 
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
        waybar # Taskbar
        libsForQt5.dolphin # Literally just the Dolphin window manager
        networkmanagerapplet # GUI for networkmanager
        wofi # App launcher
        swww # For wallpapers
        meson
        wayland-protocols
        wayland-utils
        wl-clipboard
        wlroots
        cliphist # Clipboard Manager
    ];
}