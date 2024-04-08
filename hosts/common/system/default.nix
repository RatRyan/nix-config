{ pkgs, ... }: {
  imports = [
    ./bootloader.nix
    ./locale.nix
    ./audio.nix
    ./fonts.nix
  ];
}
