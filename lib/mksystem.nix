{ inputs, nixpkgs }: hostname: { system, hardware, stateVersion }:
let
  hardwareConfig = ../hardware/${hardware}.nix;
in nixpkgs.lib.mkSystem rec
{
  inherit system;

  modules = [
    hardwareConfig
    ../configuration.nix
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.ryan = import ./home.nix;
    }
  ];
}
