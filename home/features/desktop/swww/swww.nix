{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.features.desktop.swww;

  wallpaper_filenames =
    builtins.map (name: ../../../../lib/wallpapers + "/${name}")
    (builtins.filter (f: builtins.match "^.*\\.(jpg|jpeg|png)$" f != null)
      (builtins.attrNames (builtins.readDir ../../../../lib/wallpapers)));
in {
  options.features.desktop.swww.enable = mkEnableOption "swww config";

  config = mkIf cfg.enable {
    home.packages = [inputs.swww.packages.${pkgs.system}.swww];

    xdg.dataFile."change_wallpaper.sh" = {
      enable = true;
      text = ''
        set -e
        while true; do
          BG=`find ${../../../../lib/wallpapers} -name "*.jpg" -o -name "*.png" | shuf -n1`
          if pgrep swww-daemon >/dev/null; then
            swww img "$BG" \
              --transition-fps 60 \
              --transition-duration 2 \
              --transition-type random \
              --transition-pos top-right \
              --transition-bezier .3,0,0,.99 \
              --transition-angle 135 || true
          else
            (swww-daemon 1>/dev/null 2>/dev/null &) || true
          fi
          sleep 1800
        done
      '';
    };
    xdg.dataFile."next_wallpaper.sh" = {
      enable = true;
      text = ''
        set -e
        BG=`find ${../../../../lib/wallpapers} -name "*.jpg" -o -name "*.png" | shuf -n1`
        if pgrep swww-daemon >/dev/null; then
          swww img "$BG" \
            --transition-fps 60 \
            --transition-duration 2 \
            --transition-type random \
            --transition-pos top-right \
            --transition-bezier .3,0,0,.99 \
            --transition-angle 135 || true
        else
          (swww-daemon 1>/dev/null 2>/dev/null &) || true
          swww img "$BG" \
            --transition-fps 60 \
            --transition-duration 2 \
            --transition-type random \
            --transition-pos top-right \
            --transition-bezier .3,0,0,.99 \
            --transition-angle 135 || true
        fi
      '';
    };
  };
}

# taken from 
# https://github.com/V3ntus/nixos/blob/main/features/home-manager/desktop/addons/wallpapers.nix