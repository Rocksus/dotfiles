{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.utils._1password;
in {
  options.utils._1password.enable =
  mkEnableOption "enable 1password";

  config = mkIf cfg.enable {
    programs = {
        _1password = {
        enable = true;
      };
      _1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "rocksus" ];
        # polkitPolicyOwners = config.users.groups.wheel.members;
      };

    };

    environment.etc = {
      "1password/custom_allowed_browsers" = {
        text = ''
          .zen-wrapped
        '';
        mode = "0755";
      };
    };
  };
}

# https://wiki.nixos.org/wiki/1Password
# TODO: setup 1pw agent, ssh signing