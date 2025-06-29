{pkgs, ...}: {
  imports = [
    ./bruno.nix
  ];

  home.packages = with pkgs; [
  ];
}