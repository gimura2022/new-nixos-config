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
    initialHashedPassword = "$y$j9T$j5J4J4XvP0Grp4zoUq90k0$YdE/ILiroQ.ng.IikVxWo/ufy0xfPKAh5jdYzssihy4";
  };
}
