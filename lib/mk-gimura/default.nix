{ custom ? { ... }: {}, ... }@inputs':
{ state-version, ... }@inputs: let
  inputs'' = inputs // inputs';
in {
  home = {
    username = "gimura";
    homeDirectory = "/home/gimura";
    stateVersion = state-version;
  };
} // custom inputs'' // import ./modules inputs''
