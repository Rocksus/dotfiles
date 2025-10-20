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
            enableGlobalCompInit = true;

            sessionVariables = {
                NIX_PATH = "nixpkgs=channel:nixos-unstable";
                NIX_LOG  = "info";
                TERMINAL = "kitty";
            };
            envExtra             = ''
                export EDITOR=nvim
            '';

            ohMyZsh = {
                enable = true;
                plugins = [
                    "git"
                ];
                theme = "agnoster";
                
                customPkgs = with pkgs; [
                    zsh-git-prompt
                    zsh-nix-shell
                    zsh-vi-mode
                    zsh-completions
                    zsh-command-time
                    zsh-fast-syntax-highlighting
                    nix-zsh-completions
                ];
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