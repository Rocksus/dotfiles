{pkgs, ...}: {
  imports = [
    ./swww.nix
  ];

  home.packages = with pkgs; [
  ];
}