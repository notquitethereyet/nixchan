{ pkgs, inputs, ... }:  

let
  pythonEnv311 = pkgs.python311.withPackages (pythonPackages: with pythonPackages; [
    numpy
    pandas
    matplotlib
    requests
    pygobject3
    uv
  ]);
in
{
  environment.systemPackages = with pkgs; [
    direnv
    postman
    nodejs
    docker
    pnpm
    vscode
    git
    lazygit
    gcc
    neovim
    pythonEnv311
    windsurf
    libreoffice-still
    # python311Packages.uv  # Python package manager that's fast and supports virtualenvs
  ];
}
