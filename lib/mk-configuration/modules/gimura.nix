{ pkgs, ... }:
{
  programs.zsh.enable = true;

  users.users.gimura = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "input"
      "networkmanager"
      "audio"
    ];
    shell = pkgs.zsh;
    initialPassword = "1111";
  };
}
