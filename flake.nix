{
  description = ":)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    mkSystem = import ./lib/mksystem.nix {
      inherit inputs nixpkgs;
    };
  in
  {
    nixosConfigurations = {
      # Laptop
      ifrit = mkSystem "ifrit" {
        system = "x86_64-linux";
        hardware = "thinkpad";
        stateVersion = "24.05";
      };
    };
  };
}
