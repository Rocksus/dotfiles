{pkgs, ...}: {
  imports = [
    ./wayland.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./mako.nix
    # ./wofi.nix
    ./rofi.nix
    ./anyrun.nix
  ];

  home.packages = with pkgs; [
  ];
}