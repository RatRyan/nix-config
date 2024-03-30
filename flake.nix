{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
    fleek.url = "https://flakehub.com/f/ublue-os/fleek/0.10.5.tar.gz";

    home-manager = {
      url = "github:misterio77/home-manager/xdg-portal-update";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs: {
    nixosConfigurations = {
      # Personal Desktop
      byregot = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/byregot ];
        specialArgs = { inherit inputs; };
      };
      # School Laptop
      rhalgr = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/rhalgr ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
