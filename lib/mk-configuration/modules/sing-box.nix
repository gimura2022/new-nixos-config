{ config, ... }:
{
  sops.secrets.vpn = {
    restartUnits = [ "sing-box.service" ];
  };

  services.sing-box = {
    enable = true;
    settings = {
      _secret = config.sops.secrets.vpn.path;
      quote = false;
    };
  };
}
