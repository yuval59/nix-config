{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ffmpeg-full # FFMpeg
    vlc # VLC player
    obs-studio # OBS
    tvnamer # TV Shows File Renamer
    plex-media-player # Plex
    spotify # Spotify
  ];
}
