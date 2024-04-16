{ inputs, config, lib, ... }: {
  nix = {
    registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      substituters = [ "https://cache.nixos.org/" ];
      trusted-substituters = [ https://cache.nixos.org https://alexeyraga.cachix.org ];
      trusted-users = [ "root" "ryan" ];
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than +3";
    };
    nixPath = ["/etc/nix/path"];
  };

  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;
}
