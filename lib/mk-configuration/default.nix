{ custom ? { ... }: {}, ... }@inputs':
{ state-version, ... }@inputs: let
  inputs'' = inputs // inputs';
in {
  system.stateVersion = state-version;
  nix.extraOptions = [ "flakes" "nix-command" ];
} // custom inputs'' // import ./modules inputs''
