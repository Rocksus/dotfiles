{
    imports = [ 
        ../common 
        ./configuration.nix
        ./secrets.nix
        ./services
    ];

    utils = {
        podman.enable = true;
        openssh.enable
    };
}
