# Python development tools and settings
{ config, lib, pkgs, ... }:

let
  pythonEnv = pkgs.python311.withPackages (pythonPackages: with pythonPackages; [
    pip
    # Add other Python packages here as needed
  ]);
in
{
  environment.systemPackages = with pkgs; [
    pythonEnv
  ];
}
