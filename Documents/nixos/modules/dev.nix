{ pkgs, inputs, ... }:  

let
  pythonEnv310 = pkgs.python311.withPackages (pythonPackages: with pythonPackages; [
    pip
    uv
  ]);
in
{
  environment.systemPackages = with pkgs; [
    direnv
    devenv
    postman
    nodejs
    docker
    pnpm
    vscode
    git
    lazygit
    gcc
    pythonEnv310
    windsurf
    libreoffice-still
    # python311Packages.uv  # Python package manager that's fast and supports virtualenvs
  ];
}
