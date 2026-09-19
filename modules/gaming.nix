{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    protonup-qt # Proton Compatibility Layer
    steam # Steam
    prismlauncher # Prism Minecraft Launcher
    lutris # OSS General Launcher
    # r2modman # Mod Manager for many games
    ckan # Mod manager for KSP specifically

    scanmem # Scanning memory for running apps
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
}
