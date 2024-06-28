{
  services.keyd = {
    enable = true;
    keyboards.default.settings = {
      main = {
        capslock = "overload(nav, backspace)";
      };
      nav = {
        q = "escape";
        j = "left";
        k = "down";
        i = "up";
        l = "right";
        u = "home";
        o = "end";
        p = "delete";
        ";" = "backspace";
      };
    };
  };
}
