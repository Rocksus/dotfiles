{
    imports = [ 
        ../common 
        ./configuration.nix
        ./services
    ];

    utils = {
        podman.enable = true;
        openssh.enable = true;
        tailscale.enable = true;
    };
}
