{ config, pkgs, lib, ... }:
{
  imports = [
    ../../modules/configuration.nix

    ./hardware-configuration.nix 
  ];

  # Configure keymap in X11
  services.xserver = {
    layout = lib.mkForce "us";
    xkbVariant = lib.mkForce "colemak_dh_wide";
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(nav, backspace)";
          };
          nav = {
            q = "escape";
            k = "left";
            l = "down";
            o = "up";
            ";" = "right";
            j = "pagedown";
            u = "pageup";
            i = "home";
            p = "end";
            "[" = "delete";
            "'" = "backspace";
          };
        };
      };
    };
  };
}
