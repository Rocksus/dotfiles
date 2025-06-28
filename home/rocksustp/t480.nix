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
            wayland.enable = true;
            hyprland.enable = true;
        };
    };
}
