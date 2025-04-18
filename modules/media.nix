{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ffmpeg-full # FFMpeg
    vlc # VLC player
    tvnamer # TV Shows File Renamer
    # plex-media-player # Plex
    spotify # Spotify

    obs-studio # OBS
    linuxKernel.packages.linux_zen.v4l2loopback # OBS Virtual Camera Support
  ];
}
