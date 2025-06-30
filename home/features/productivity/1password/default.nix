{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.productivity.1password;
in {
    options.features.productivity.1password.enable =
    mkEnableOption "enable 1password";

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            _1password-gui
            _1password
        ];
    };
}