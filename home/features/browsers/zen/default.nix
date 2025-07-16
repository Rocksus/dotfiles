{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.features.browsers.zen-browser;
in {
    options.features.browsers.zen-browser.enable =
    mkEnableOption "enable zen browser best browser";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            inputs.zen-browser.packages."${system}".specific
        ];
    };
}
