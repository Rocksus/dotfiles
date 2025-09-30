{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programming.utilities.devenv;
in {
    options.features.programming.utilities.devenv.enable =
    mkEnableOption "enable devenv";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            devenv
        ];
    };
}