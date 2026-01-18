{
  lib,
  enable-gimura ? true,
  enable-docs ? true,
  enable-default-pkgs ? true,
  enable-zram ? false,
  enable-bluetooth ? false,
  enable-sing-box ? true,
  enable-nixvim ? true,
  enable-iso ? false,
  ...
}: {
  imports = [
    ./boot.nix
    ./networking.nix
    ./time.nix
    ./stylix.nix
    ./nix.nix
  ] ++ lib.optional enable-gimura ./gimura.nix
    ++ lib.optional enable-docs ./docs.nix
    ++ lib.optional enable-default-pkgs ./packages.nix
    ++ lib.optional enable-zram ./zram.nix
    ++ lib.optional enable-bluetooth ./bluetooth.nix
    ++ lib.optional enable-nixvim ./nixvim
    ++ lib.optional enable-iso ./iso.nix
    ++ lib.optional enable-sing-box ./sing-box.nix;
}
