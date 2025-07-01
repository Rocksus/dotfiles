{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.productivity._1password;
  onePassPath = "~/.1password/agent.sock";
in {
    options.features.productivity._1password.enable =
    mkEnableOption "enable 1password";

    config = mkIf cfg.enable {
      home.packages = with pkgs; [
        _1password
        _1password-gui
      ];

      programs = {
        # _1password = {
        #  enable = true;
        #  package = pkgs._1password;
        #};
        #_1password-gui = {
        #  enable = true;
        #  package = pkgs._1password-gui;
        #  polkitPolicyOwners = [ "rocksustp" ];
        #  # polkitPolicyOwners = config.users.groups.wheel.members;
        #};

      };
    };
}

# https://wiki.nixos.org/wiki/1Password
# TODO: setup 1pw agent, ssh signing