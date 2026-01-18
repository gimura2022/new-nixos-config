{ config, ... }:
{
  sops.secrets.vpn.sopsFile = ../../../secrets/vpn.json;

  services.sing-box = {
    enable = true;
    settings = config.sops.secrets.vpn;
  };
}
