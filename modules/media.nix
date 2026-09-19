{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ffmpeg-full # FFMpeg
    vlc # VLC player
    tvnamer # TV Shows File Renamer
    (callPackage ./plex/package.nix {}) # Plex
    spotify # Spotify

    obs-studio # OBS
    linuxPackages.v4l2loopback # OBS Virtual Camera Support
  ];
}
