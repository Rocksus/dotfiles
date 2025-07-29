{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.design.affinityphoto;
in {
    options.features.design.affinityphoto.enable =
    mkEnableOption "enable affinity photo image editing software";

    config = mkIf cfg.enable {
        home.packages = [
            inputs.affinity-nix.packages.${pkgs.system}.photo
        ];
    };
}