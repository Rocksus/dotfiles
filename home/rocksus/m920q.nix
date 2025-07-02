{ config, ... }: { 
    imports = [ 
        ../common
        ./home.nix 
        ../features/cli
        ../features/desktop
    ];

    features = {
        cli = {
            zsh.enable = true;
            fzf.enable = true;
        };
        desktop = {
            fonts.enable = true;
        };
    };
}
