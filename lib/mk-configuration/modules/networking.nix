{ host-name, ... }:
{
  networking = {
    hostName = host-name;
    networkmanager.enable = true;
  };
}
