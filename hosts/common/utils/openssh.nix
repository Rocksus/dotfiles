{ config, lib, pkgs, ... }:
with lib; let
    cfg = config.utils.openssh;
in {
    options.utils.openssh.enable = mkEnableOption "enable openssh";

    config = mkIf cfg.enable {
        services.openssh = {
            enable = true;
            ports = [ 22 ];
            settings = {
                PasswordAuthentication = true;
                AllowUsers = [ "rocksus" ]; # Allows all users by default. Can be [ "user1" "user2" ]
                UseDns = true;
                X11Forwarding = false;
                PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
            };
        };
    };
}