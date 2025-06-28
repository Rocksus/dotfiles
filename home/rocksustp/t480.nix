{ config, ... }: { 
    imports = [ 
        ../common
        ./home.nix 
        ../features/editors/vscode
        ../features/cli
        ../features/browsers
        ../features/programming
        # ./features/productivity
    ];

    features = {
        cli = {
            zsh.enable = true;
        };
    };
}
