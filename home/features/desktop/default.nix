{pkgs, ...}: {
  imports = [
    ./hyprland
    ./swww
    ./fonts.nix
    ./office.nix
    ./media.nix
    ./slack.nix
  ];

  home.packages = with pkgs; [
  ];
}