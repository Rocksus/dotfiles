{pkgs, ...}: {
  imports = [
    ./wayland.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./mako.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [
  ];
}