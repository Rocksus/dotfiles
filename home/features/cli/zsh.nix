{
    config,
    lib,
    pkgs,
    ...
}: with lib; let cfg = config.features.cli.zsh;
in {
    options.features.cli.zsh.enable = mkEnableOption "enable extended zsh configuration";

    config = mkIf cfg.enable {
        programs.zsh = {
            enable = true;

            # Commands to run at login (e.g. when your user logs in)
            loginShellInit = ''
                export NIX_PATH="nixpkgs=channel:nixos-unstable"
                export NIX_LOG="info"
                export TERMINAL="ghostty"

                if [[ "$(tty)" == "/dev/tty1" ]]; then
                    Hyprland &> /dev/null &
                    exit
                fi
            '';

            # Commands to run for every interactive shell
            interactiveShellInit = ''
                fastfetch
            '';

            shellAliases = {
                ls    = "eza";
                grep  = "rg";
                ps    = "procs";
            };
        };
    };
}