{ config, ... }: { 
    imports = [ 
        ../common
        ./home.nix 
        ../features/editors/vscode
        ../features/cli
        ../features/browsers
        ../features/programming
        ../features/desktop
        ../features/design
    ];

    features = {
        browsers = {
            zen-browser.enable = true;
        };
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
            swww.enable = true;
            rofi.enable = true;
        };
        programming = {
            utilities = {
                bruno.enable = true;
                obsidian.enable = true;
                dbeaver.enable = true;
            };
        };
        design = {
            affinitydesigner.enable = true;
            affinityphoto.enable = true;
            affinitypublisher.enable = false;
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
            monitor = [
                "eDP-1,1920x1080@60,0x0,1"
            ];
        };
    };
}
