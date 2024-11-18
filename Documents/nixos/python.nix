{ pkgs }:

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
  pythonEnv = pythonEnv;
}
