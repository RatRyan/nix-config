{ inputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./system
    ./services
    ./docker.nix
    ./plasma.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    inputs.fh.packages.x86_64-linux.default

    # CLI tools
    vim
    wget
    unzip
    git
    gh
    fish
    btop
    zoxide
    fzf
    eza
    stow
    starship
    neofetch
    lazygit
    lazydocker
    msbuild

    # Misc
    firefox
    wezterm
    xclip
    wl-clipboard
    home-manager
  ];

  xdg.portal.enable = true;

  services.envfs.enable = true;

  users.users = {
    ryan = {
      isNormalUser = true;
      description = "Ryan Ratajczak";
      extraGroups = ["wheel" "networkmanager" "docker"];
    };
  };

  programs = {
    hyprland.enable = true;
    steam.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      ryan = import ../../home;
    };
  };
}
