{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [ 
      # nix formatter
      # https://github.com/NixOS/nixfmt
      pkgs.nixfmt

      # lsp
      # https://github.com/nix-community/nixd
      nixd
    ];
  };
}
