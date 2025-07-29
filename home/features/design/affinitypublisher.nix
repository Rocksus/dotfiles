{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.design.affinitypublisher;
in {
    options.features.design.affinitypublisher.enable =
    mkEnableOption "enable affinity publisher software";

    config = mkIf cfg.enable {
        home.packages = [
            inputs.affinity-nix.packages.${pkgs.system}.publisher
        ];
    };
}