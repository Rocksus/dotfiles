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
            enableCompletion = true;
            syntaxHighlighting.enable = true;
            autosuggestion.enable = true;

            sessionVariables = {
                NIX_PATH = "nixpkgs=channel:nixos-unstable";
                NIX_LOG  = "info";
                TERMINAL = "kitty";
            };
            envExtra             = ''
                export EDITOR=nvim
            '';

            oh-my-zsh = {
                enable = true;
                plugins = [
                    "git"
                ];
                theme = "agnoster";
            };

            # Commands to run at login (e.g. when your user logs in)
            loginExtra = ''
                if [[ "$(tty)" == "/dev/tty1" ]]; then
                Hyprland &> /dev/null &
                exit
                fi
            '';

            # run on every new interactive shell
            initContent = ''
                fastfetch
            '';

            shellAliases = {
                ls    = "eza";
                grep  = "rg";
                ps    = "procs";
                vim   = "nvim";
            };
        };
    };
}