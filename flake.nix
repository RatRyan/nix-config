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
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      nixosConfigurations = {
        # Personal Desktop
        byregot = nixpkgs.lib.nixosSystem {
          modules = [ ./hosts/byregot ];
          specialArgs = { inherit inputs outputs; };
        };
        # School Laptop
        rhalgr = nixpkgs.lib.nixosSystem {
          modules = [ ./hosts/rhalgr ];
          specialArgs = { inherit inputs outputs; };
        };
      };
    };
}
