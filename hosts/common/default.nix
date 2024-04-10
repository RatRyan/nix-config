{ inputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./docker.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./opengl.nix
    ./plasma.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
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

    # Misc
    firefox
    wezterm
    xclip
    wl-clipboard
    home-manager
  ];

  xdg.portal.enable = true;

  services.envfs.enable = true;
  services.gnome.gnome-keyring.enable = true;

  users.users = {
    ryan = {
      isNormalUser = true;
      description = "Ryan Ratajczak";
      extraGroups = ["wheel" "networkmanager" "docker"];
    };
  };

  programs = {
    steam.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      ryan = import ../../home;
    };
  };
}
