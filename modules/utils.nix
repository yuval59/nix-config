{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gparted # Partition Manager
    firefox # Browser
    qbittorrent # Torrents
    jackett # Torrent finder
    stress # Stress-test
    kdePackages.kate # Text Editor
    unrar # Utility for RAR files
    htop # Basic Process Viewer
    usbimager # ISO Imager
    xclicker # Autoclicker
    speedcrunch # Calculator
    gimp # Image Editor
    kdePackages.kdenlive # FOSS Video-Editing Software
    appimage-run # AppImage support
    krita # Photo editing and drawing
    ungoogled-chromium # Chromium, minus Google services
    # motrix # Download manager
    chatterino2 # Twitch Chat Client
    remmina # RDP and such
    proton-pass # Password manager
    xkcdpass # Funny password gen
    unixtools.quota # Disk Usage stats for KDE
    testdisk
    screen # GNU Screen
    proton-vpn # VPN
    appimage-run # Running appimages
    filezilla # GUI for FTP and SFTP
    ranger # Viewing filesystem in CLI
    jump # For faster cd
    opencode # Opencode 
    opencode-desktop # Opencode with GUI
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  security.polkit.enable = true;
}
