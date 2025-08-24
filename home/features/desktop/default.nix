{pkgs, ...}: {
  imports = [
    ./hyprland
    ./swww
    ./fonts.nix
    ./office.nix
    ./media.nix
    ./slack.nix
    ./libnotify.nix
  ];

  home.packages = with pkgs; [
  ];
}