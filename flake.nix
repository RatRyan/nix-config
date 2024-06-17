{
  description = ":)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      ifrit = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware/thinkpad.nix
          ./configuration.nix
          { networking.hostName = "ifrit"; }
        ];
      };
    };
  };
}
