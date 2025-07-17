{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programming.utilities.obsidian;
in {
    options.features.programming.utilities.obsidian.enable =
    mkEnableOption "enable obsidian http client";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            obsidian
        ];
    };
}