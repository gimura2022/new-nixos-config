{ pkgs, ... }:
{
  documentation = {
    enable = true;

    man.enable = true;
    dev.enable = true;
    doc.enable = true;
    info.enable = true;
    nixos.enable = true;
  };

  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
  ];
}
