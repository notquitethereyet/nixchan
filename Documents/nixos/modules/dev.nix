{ pkgs, inputs, ... }:  

let
  pythonEnv311 = pkgs.python311.withPackages (pythonPackages: with pythonPackages; [
    numpy
    pandas
    matplotlib
    requests
    pygobject3
  ]);
in
{
  environment.systemPackages = with pkgs; [
    direnv
    postman
    nodejs
    docker
    pnpm
    github-desktop
    vscode
    git
    lazygit
    gcc
    neovim
    pythonEnv311
    windsurf
    libreoffice-still
  ];
}
