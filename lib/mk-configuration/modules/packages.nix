{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    unzip
    zip
    gcc
    gdb
    gnumake
    ghc
    git
    wget
    curl
    ffmpeg
  ];
}
