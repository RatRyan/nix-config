{
  description = "Flake configuration for my systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:misterio77/home-manager/xdg-portal-update";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs: {
    nixosConfigurations = {
      # Personal Desktop
      byregot = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/byregot ];
        specialArgs = { inherit inputs home-manager; };
      };
      # School Laptop
      rhalgr = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/rhalgr ];
        specialArgs = { inherit inputs home-manager; };
      };
    };
  };
}
