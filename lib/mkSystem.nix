{ nixpkgs, inputs }: name: { system, user, extraModules ? [{}] }: 
let
  hardwareConfig = ../hosts/${user}/hardware-configuration.nix;
  systemConfig = ../hosts/${user}/configuration.nix;
  homeConfig = ../home/${user}/home-manager.nix;
in 
  nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      hardwareConfig
      systemConfig
      inputs.home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${user} = import homeConfig;
      }
    ] ++ extraModules;
    specialArgs = { inherit inputs; };
  }
      