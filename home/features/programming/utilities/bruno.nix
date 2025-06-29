{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programming.utilities.bruno;
in {
    options.features.programming.utilities.bruno.enable =
    mkEnableOption "enable bruno http client";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            bruno
        ];
    }
}