{pkgs, ...}: {
  imports = [
    ./bruno.nix
    ./obsidian.nix
    ./dbeaver.nix
    ./postgres.nix
  ];

  home.packages = with pkgs; [
  ];
}