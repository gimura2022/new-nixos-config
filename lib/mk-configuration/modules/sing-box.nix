{ config, ... }:
{
  sops.secrets.vpn = {
    restartUnits = [ "sing-box.service" ];
  };

  services.sing-box = {
    enable = true;
    settings = config.sops.secrets.vpn;
  };
}
