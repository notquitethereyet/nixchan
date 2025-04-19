# Web development tools and settings
{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Node.js and related tools
    nodejs
    pnpm
    
    # API testing
    postman
    
    # Container support
    docker
    
    # Add other web development tools here as needed
  ];
}
