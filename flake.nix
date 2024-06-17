{
  description = ":)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    mySystem = import ./lib/mkSystem.nix {
      inherit inputs nixpkgs
    }
  in
  {
    nixosConfigurations = {
      # Laptop
      ifrit = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware/thinkpad.nix
          ./configuration.nix
          { 
            networking.hostName = "ifrit";
            system.stateVersion = "24.05";
          }
        ];
      };
    };
  };
}
