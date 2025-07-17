{pkgs, ...}: {
  imports = [
    ./bruno.nix
    ./obsidian.nix
  ];

  home.packages = with pkgs; [
  ];
}