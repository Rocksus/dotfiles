{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programming.utilities.cherry-studio;
in {
    options.features.programming.utilities.cherry-studio.enable =
    mkEnableOption "enable cherrystudio http client";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            cherry-studio
        ];
    };
}