{ config, ... }:
{
  services.sing-box = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile config.sops.secrets.element-message-key.path);
  };
}
