{ custom ? { ... }: {}, ... }@inputs':
{ state-version, ... }@inputs: let
  inputs'' = inputs // inputs';
in {
  system.stateVersion = state-version;
} // custom inputs'' // import ./modules inputs''
