{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gparted # Partition Manager
    firefox # Browser
    qbittorrent-qt5 # Torrents
    stress # Stress-test
    kate # Text Editor
    usbimager # ISO Imager

    # Calculators
    speedcrunch
    libsForQt5.kcalc
    # Calculators
  ];
}
