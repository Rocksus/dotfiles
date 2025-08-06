{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [ 
      # nix formatter
      # https://github.com/NixOS/nixfmt
      pkgs.nixfmt-rfc-style 

      # lsp
      # https://github.com/nix-community/nixd
      nixd
    ];
  };
}
