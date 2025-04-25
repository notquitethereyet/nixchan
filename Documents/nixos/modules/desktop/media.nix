# Media applications and utilities
{ config, lib, pkgs, ... }:

{
  # Media-related packages
  environment.systemPackages = with pkgs; [
    # Music and audio
    spotify
    mpd
    playerctl
    
    # Video players
    vlc
    mpv
    
    # Image viewers and editors
    imagemagick
    # openshot-qt
    libsForQt5.kdenlive
    
    # Streaming and recording
    obs-studio
  ];
}
