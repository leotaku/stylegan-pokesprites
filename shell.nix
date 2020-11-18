{ pkgs ? import <nixpkgs> { } }:
let
  src = pkgs.fetchFromGitHub {
    owner = "DavHau";
    repo = "mach-nix";
    rev = "9aa62d0d03587a2fb0accae70e4c036df51b0e13"; # tags/3.0.2
    sha256 = "0w6i3wx9jyn29nnp6lsdk5kwlffpnsr4c80jk10s3drqyarckl2f";
  };
  mach-nix = import src {
    python = "python37";
    inherit pkgs;
  };
in mach-nix.mkPythonShell {
  requirements = builtins.readFile ./requirements.txt;
  packagesExtra = with pkgs; [ wget nodejs_latest ];
}
