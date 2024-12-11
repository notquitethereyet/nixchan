{ pkgs, inputs, ... }:  # Allow the function to accept extra arguments

let
  pythonEnv = pkgs.python312.withPackages (pythonPackages: with pythonPackages; [
    numpy
    pandas
    matplotlib
    requests
    pygobject3
    # Add more Python packages here
  ]);
in
{
  environment.systemPackages = with pkgs; [
    # Development tools
    direnv
    postman
    code-cursor
    nodejs
    docker
    pnpm
    github-desktop
    vscode
    git
    lazygit
    gcc
    neovim
    # Python environment
    pythonEnv
  ];
}
