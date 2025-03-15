{ pkgs, inputs, ... }:  

let
  # pythonEnv310 = pkgs.python310.withPackages (pythonPackages: with pythonPackages; [
  #   numpy
  #   pandas
  #   matplotlib
  #   requests
  #   pygobject3
  #   pythonPackages.tkinter  # Explicitly add tkinter
  # ]);

  pythonEnv312 = pkgs.python312.withPackages (pythonPackages: with pythonPackages; [
    numpy
    pandas
    matplotlib
    requests
    pygobject3
    # pythonPackages.tkinter  # Explicitly add tkinter
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
    # pythonEnv310
    pythonEnv312
    libreoffice-still
  ];
}
