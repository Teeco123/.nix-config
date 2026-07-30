{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap-flake = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      nur,
      zen-browser,
      nixvim,
      sops-nix,
      noctalia,
      ...
    }@inputs:
    {
      formatter = {
        aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt-tree;
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
      };

      nixosConfigurations = {
        #  pc = nixpkgs.lib.nixosSystem {
        #    system = "x86_64-linux";
        #    modules = [
        #      ./hosts/pc/configuration.nix
        #      home-manager.nixosModules.home-manager
        #      nur.modules.nixos.default
        #      {
        #        home-manager = {
        #          useGlobalPkgs = true;
        #          useUserPackages = true;
        #          extraSpecialArgs = { inherit inputs; };
        #          users.kacper = ./hosts/pc/home.nix;
        #        };
        #      }
        #    ];
        #  };
        server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./machines/server/configuration.nix
            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            sops-nix.nixosModules.sops
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.server = ./machines/server/home.nix;
              };
            }
          ];
        };
      };
      darwinConfigurations = {
        "Kacpers-MacBook-Pro" = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./machines/macbook/configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.kacper = ./machines/macbook/home.nix;
              };
            }
          ];
        };
      };
    };
}
