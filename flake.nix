{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon";
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
    vicinae = {
      url = "github:vicinaehq/vicinae";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      apple-silicon,
      nur,
      zen-browser,
      nixvim,
      sops-nix,
      vicinae,
      noctalia,
      stylix,
      disko,
      deploy-rs,
      ...
    }@inputs:
    {
      formatter = {
        aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt-tree;
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
      };

      nixosConfigurations = {
        pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/pc/configuration.nix
            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.kacper = ./hosts/pc/home.nix;
              };
            }
          ];
        };
        server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/server/configuration.nix
            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            sops-nix.nixosModules.sops
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.server = ./hosts/server/home.nix;
              };
            }
          ];
        };
        macbook = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            ./hosts/macbook/configuration.nix
            apple-silicon.nixosModules.default
            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            sops-nix.nixosModules.sops
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users = {
                  kacper = ./hosts/macbook/kacper.nix;
                  blanka = ./hosts/macbook/blanka.nix;
                };
              };
            }
          ];
        };
        a = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            disko.nixosModules.disko
            ./hosts/a/configuration.nix
          ];
        };
        b = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            disko.nixosModules.disko
            ./hosts/b/configuration.nix
          ];
        };
        c = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            disko.nixosModules.disko
            ./hosts/c/configuration.nix
          ];
        };
      };

      deploy.nodes = {
        a = {
          hostname = "192.168.122.10";
          profiles.system.path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.a;
        };
        b = {
          hostname = "192.168.122.11";
          profiles.system.path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.b;
        };
        c = {
          hostname = "192.168.122.12";
          profiles.system.path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.c;
        };
        pc = {
          hostname = "192.168.100.13";
          remoteBuild = true;
          profiles.system = {
            sshUser = "kacper";
            path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.pc;
          };
        };
      };
    };
}
