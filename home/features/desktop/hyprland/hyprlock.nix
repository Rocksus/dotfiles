{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.hyprlock;
in {
  options.features.desktop.hyprlock.enable = mkEnableOption "hyprlock config";

  config = mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;

      settings = {
        background = {
          path = "screenshot";

          blur_passes = 2;
          blur_size = 7;

          brightness = 0.8;
          contrast = 0.8;

          color = "rgb(202, 211, 245)";
        };

        input-field = {
          size = {
            width = 200;
            height = 50;
          };

          outline_thickness = 3;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = false;
          outer_color = "rgb(24, 25, 38)";
          inner_color = "rgb(91, 96, 120)";
          font_color = "rgb(202, 211, 245)";
          fade_on_empty = true;
          placeholder_text = "<i>Input Password...</i>";
          hide_input = false;
          position = {
            x = 0;
            y = -20;
          };
          halign = "center";
          valign = "center";
        };

        label = {
          text = "$TIME";
          color = "rgb(202, 211, 245)";
          font_size = 50;
          font_family = "Noto Sans";
          position = {
            x = 0;
            y = 80;
          };
          halign = "center";
          valign = "center";
        };
      };
    };
  };
}
