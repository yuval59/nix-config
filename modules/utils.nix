{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git # I mean...
    gparted # Partition Manager
    firefox # Browser
    qbittorrent # Torrents
    stress # Stress-test
    kdePackages.kate # Text Editor
    unrar # Utility for RAR files
    htop # Basic Process Viewer
    usbimager # ISO Imager
    xclicker # Autoclicker
    speedcrunch # Calculator
    libsForQt5.kcalc # Calculator
    gimp # Image Editor
    kdePackages.kdenlive # FOSS Video-Editing Software
    appimage-run # AppImage support
    krita # Photo editing and drawing
    ungoogled-chromium # Chromium, minus Google services
    # motrix # Download manager
    aircrack-ng
    johnny
  ];
}
