{
  lib,
  enable-gimura ? true,
  enable-docs ? true,
  enable-default-pkgs ? true,
  enable-zram ? false,
  enable-bluetooth ? false,
  ...
}: {
  imports = [
    ./boot.nix
    ./networking.nix
    ./time.nix
    ./stylix.nix
  ] ++ lib.optional enable-gimura ./gimura.nix
    ++ lib.optional enable-docs ./docs.nix
    ++ lib.optional enable-default-pkgs ./packages.nix
    ++ lib.optional enable-zram ./zram.nix
    ++ lib.optional enable-bluetooth ./bluetooth.nix;
}
