{pkgs, ...}: {
  imports = [
    ./wayland.nix
    ./hyprland.nix
    ./wofi.nix
    ./fonts.nix
    ./office.nix
    ./media.nix
  ];

  home.packages = with pkgs; [
  ];
}