{
    imports = [ 
        ../common 
        ./configuration.nix
        ./secrets.nix
        ./services
    ];

    utils = {
        podman.enable = true;
        tailscale.enable = true;
        openssh.enable = true;
        wireguard.enable = true;
    };
}
