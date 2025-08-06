{pkgs, ...}: {
  imports = [
    ./bruno.nix
    ./obsidian.nix
    ./dbeaver.nix
    ./postgtres.nix
  ];

  home.packages = with pkgs; [
  ];
}