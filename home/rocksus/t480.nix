{ config, ... }: { 
    imports = [ 
        ../common
        ./home.nix 
        ../features/editors/vscode
        ../features/cli
        ../features/browsers
        ../features/programming
        ../features/desktop
        ../features/security
        ../features/productivity
    ];

    features = {
        cli = {
            zsh.enable = true;
            fzf.enable = true;
        };
        desktop = {
            hyprland.enable = true;
            hypridle.enable = true;
            hyprlock.enable = true;
            wayland.enable = true;
            fonts.enable = true;
            office.enable = true;
            media.enable = true;
            slack.enable = true;
            mako.enable = true;
        };
        programming = {
            utilities = {
                bruno.enable = true;
            };
        };
        security = {
            wireguard.enable = false;
        };
        productivity = {
            _1password.enable = true;
        };
    };

    wayland.windowManager.hyprland = {
        settings = {
            device = [
                {
                    name = "keyboard";
                    kb_layout = "us";
                }
                {
                    name = "mouse";
                    sensitivity = -0.5;
                }
            ];
        };
    };
}
