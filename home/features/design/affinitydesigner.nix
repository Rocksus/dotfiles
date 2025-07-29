{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.design.affinitydesigner;
in {
    options.features.design.affinitydesigner.enable =
    mkEnableOption "enable affinity designer vector editing software";

    config = mkIf cfg.enable {
        home.packages = [
            inputs.affinity-nix.packages.${pkgs.system}.designer
        ];
    };
}

# https://github.com/mrshmllow/affinity-nix