{
  description = "Flake configuration for my systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
