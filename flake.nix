{
  description = "Nix Flake :slight_smile:";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem rec {
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/desktop ];
        };
        thinkpad = nixpkgs.lib.nixosSystem rec {
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/thinkpad ];
        };
      };
    };
}
