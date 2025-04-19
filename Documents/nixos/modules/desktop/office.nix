# Office applications
{ config, lib, pkgs, ... }:

{
  # Office-related packages
  environment.systemPackages = with pkgs; [
    # Office suite
    libreoffice-still
    
    # PDF viewers and editors
    # okular
    # pdfarranger
    
    # Note-taking
    # obsidian
    # joplin-desktop
    
    # Other office tools
    # calibre  # E-book management
  ];
}
