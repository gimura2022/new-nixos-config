{ config, ... }:
{
  sops.secrets.vpn = {
    restartUnits = [ "sing-box.service" ];
    owner = config.users.users.sing-box.name;
  };

  services.sing-box = {
    enable = true;
    settings = {
      _secret = config.sops.secrets.vpn.path;
      quote = false;
    };
  };
}
