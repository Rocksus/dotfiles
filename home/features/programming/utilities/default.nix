{pkgs, ...}: {
  imports = [
    ./bruno.nix
    ./obsidian.nix
    ./dbeaver.nix
    ./postgres.nix
    ./cherry-studio.nix
    ./devenv.nix
    ./duckdb.nix
    ./flyctl.nix
  ];

  home.packages = with pkgs; [
  ];
}