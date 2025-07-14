{
    imports = [ 
        ../common 
        ./configuration.nix
        ./services
    ];

    utils = {
        openssh.enable = true;
        tailscale.enable = true;
    };
}
