{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable ozone wayland support
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
