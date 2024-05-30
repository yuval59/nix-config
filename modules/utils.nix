{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gparted # Partition Manager
    firefox # Browser
    qbittorrent-qt5 # Torrents
    stress # Stress-test
    kate # Text Editor
    usbimager # ISO Imager
    xclicker # Autoclicker
    htop # Basic Process Viewer
    zenith # Process Viewer

    # Calculators
    speedcrunch
    libsForQt5.kcalc
  ];
}
