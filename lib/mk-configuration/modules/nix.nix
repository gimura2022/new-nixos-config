{
  nix = {
    settings.experimental-features = [ "flakes" "nix-command" ];

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };
}
