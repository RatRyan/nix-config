{
  descriptn = ":)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, ... }@inputs: 
  let
    mkSystem = import ./mksystem.nix { inherit inputs nixpkgs; };
  in
  {
    nixosConfigurations = {
      # Laptop
      ifrit = mkSystem "ifrit" 
      {
        system = "x86_64-linux";
        hardware = "thinkpad";
        stateVersion = "24.05";
        extraModules = [
          ./modules/nixos/thinkpad.nix
          ./modules/nixos/keyd.nix
        ];
      };
    };
  };
}
