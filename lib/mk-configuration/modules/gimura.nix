{ pkgs, config, ... }:
{
  programs.zsh.enable = true;

  sops.secrets.gimura-password = {
    owner = config.users.users.gimura.name;
  };

  users.users.gimura = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "input"
      "networkmanager"
      "audio"
    ];
    shell = pkgs.zsh;
    hashedPasswordFile = config.sops.secrets.gimura-password.path;
  };
}
