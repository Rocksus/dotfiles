{
  description = "Home-Manager module for 1Password Shell Plugins";

  inputs = {
    shell-plugins.url = "github:1Password/shell-plugins";
    shell-plugins.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, shell-plugins, ... }:
    let
      # Home-Manager library & functions
      hm = home-manager.lib;
      # Import the 1Password shell-plugins flake’s Home-Manager module
      onepassModule = import shell-plugins + "/nix/home-manager-module.nix";
    in {
      # Expose it as the default Home-Manager module from this flake
      homeManagerModules = {
        default = { pkgs, ... }: onepassModule { inherit pkgs; };
      };
    };
}
