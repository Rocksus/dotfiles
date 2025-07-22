{pkgs, ...}: {
  imports = [
    ./bruno.nix
    ./obsidian.nix
    ./dbeaver.nix
  ];

  home.packages = with pkgs; [
  ];
}