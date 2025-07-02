{pkgs, ...}: {
  imports = [
    ./hyprland
    ./fonts.nix
    ./office.nix
    ./media.nix
    ./slack.nix
  ];

  home.packages = with pkgs; [
  ];
}