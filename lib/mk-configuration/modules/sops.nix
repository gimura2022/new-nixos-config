{
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/gimura/.sops/age/keys.txt";

    secrets = {
      vpn = {};
    };
  };
}
