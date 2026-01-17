{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    stylix,
    sops-nix,
    nixvim,
    ...
  }@inputs: let
    state-version = "26.05";

    overlays = [
      (final: _: {
        stable = import nixpkgs-stable {
          inherit (final.stdenv.hostPlatform) system;
          inherit (final) config;
        };
      })
    ];

    mkSystem = {
      host-name,
      system,
      users ? [ "gimura" ],
    }: nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./system/${host-name}/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager = nixpkgs.lib.foldl' (x: y: x // { users.${y} = import ./system/${host-name}/home/${y}/home.nix; }) {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {
              inherit inputs host-name state-version;
            };
          } users;
        }

        stylix.nixosModules.stylix
        sops-nix.nixosModules.sops
        nixvim.nixosModules.nixvim
      ];

      pkgs = import nixpkgs {
        inherit system overlays;
      };

      specialArgs = {
        inherit inputs host-name state-version;
      };
    };
  in {
    nixosConfigurations.nixos-vm = mkSystem {
      system = "x86_64-linux";
      host-name = "nixos-vm";
    };
  };
}
