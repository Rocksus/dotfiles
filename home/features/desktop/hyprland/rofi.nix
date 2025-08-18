{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.rofi;
in {
  options.features.desktop.rofi.enable = mkEnableOption "enable rofi";

  config = mkIf cfg.enable {
    programs.rofi = with pkgs; {
      enable = true;
      package = rofi.override {
        plugins = [
          rofi-calc
          rofi-emoji
          stable.rofi-file-browser
        ];
      };
      terminal = "\${pkgs.ghostty}/bin/ghostty";
      font = "FiraCode Nerd Font";
      extraConfig = {
        show-icons = true;
        disable-history = false;
        modi = "drun,calc,emoji,filebrowser";
        kb-primary-paste = "Control+V,Shift+Insert";
        kb-secondary-paste = "Control+v,Insert";
      };
      # theme = "catppucin-macchiato";
    };
    home.file.".config/rofi/scripts/next_wallpaper_rofi.sh" = mkIf config.features.desktop.swww.enable {
      executable = true;
      text = ''
        #!/bin/sh
        # This script changes the wallpaper using swww via Rofi.
        ~/.local/share/xdg/next_wallpaper.sh
      '';
    };
  };
}
