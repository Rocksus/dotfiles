{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.security.wireguard;
in {
    options.features.security.wireguard.enable =
    mkEnableOption "enable wireguard";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            wireguard
        ];
    };
}

# error: undefined variable 'wireguard'