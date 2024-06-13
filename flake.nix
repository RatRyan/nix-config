{
  description = "Flake configuration for my systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:misterio77/home-manager/xdg-portal-update";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # Personal Desktop
      titan = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/titan ];
        specialArgs = { inherit inputs; };
      };
      # School Laptop
      ifrit = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/ifrit ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
