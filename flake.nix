{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:misterio77/home-manager/xdg-portal-update";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        # Personal Desktop
        byregot = lib.nixosSystem {
          modules = [ ./hosts/byregot ];
          specialArgs = { inherit inputs outputs; };
        };
        # School Laptop
        rhalgr = lib.nixosSystem {
          modules = [ ./hosts/rhalgr ];
          specialArgs = { inherit inputs outputs; };
        };
      };
    };
}
