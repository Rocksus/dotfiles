{pkgs, ...}: {
  imports = [
    ./wayland.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./wofi.nix
    ./fonts.nix
    ./office.nix
    ./media.nix
    ./slack.nix
  ];

  home.packages = with pkgs; [
  ];
}