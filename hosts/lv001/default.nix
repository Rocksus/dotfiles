{
    imports = [ 
        ../common 
        ./configuration.nix
        ./secrets.nix
        ./services
    ];

    utils = {
        openssh.enable = true;
        tailscale.enable = true;
    };
}
