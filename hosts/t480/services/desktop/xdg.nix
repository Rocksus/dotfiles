{pkgs, ...}: {
    # enable xdg for screen sharing
    # https://discourse.nixos.org/t/hyprland-screen-sharing/43658/5
    # https://wiki.hypr.land/Useful-Utilities/Screen-Sharing/
    # https://github.com/fufexan/dotfiles/blob/main/system/programs/xdg.nix
    xdg = {
      portal = {
        enable = true;
        xdgOpenUsePortal = true;

        config = {
          common.default = ["gtk"];
          hyprland.default = ["gtk" "hyprland"];
        };

        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal-hyprland
        ];
      };
    };
}