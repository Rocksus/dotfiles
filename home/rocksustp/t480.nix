{ config, ... }: { 
    imports = [ 
        ../common
        ./home.nix 
        ../features/editors/vscode
        ../features/cli
        ../features/browsers
        ../features/programming
        ../features/desktop
        # ./features/productivity
    ];

    features = {
        cli = {
            zsh.enable = true;
            fzf.enable = true;
        };
        desktop = {
            hyprland.enable = true;
            wayland.enable = true;
            fonts.enable = true;
            office.enable = true;
            media.enable = true;
        };
        programming = {
            utilities = {
                bruno.enable = true;
            };
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
