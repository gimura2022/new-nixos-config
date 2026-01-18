{ modulesPath, ... }:
{
  imports = [
    "${toString modulesPath}/installer/cd-dvd/iso-image.nix"
  ];

  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
}
