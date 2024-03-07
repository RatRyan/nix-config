{
  description = "Nix Flake :slight_smile:";

  inputs = {
    # I aint a coward
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
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/desktop/configuration.nix
          ];
        };
        thinkpad = nixpkgs.lib.nixosSystem rec {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/thinkpad/configuration.nix
          ];
        };
      };
    };
}
