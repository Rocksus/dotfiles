{
  pkgs,
  hostname ? "",
  ...
}:
let
  inherit ((import ./colors.nix)) colors;
  libx = import ./lib.nix { inherit (pkgs) lib; };
in
rec {
  inherit (libx) hexToRgb;
  inherit colors;

  catppuccin = {
    flavor = "macchiato";
    accent = "blue";
    size = "standard";
  };

  gtkTheme = {
    name = "catppuccin-macchiato-blue-standard";
    package = pkgs.catppuccin-gtk.override {
      inherit (catppuccin) size;
      variant = catppuccin.flavor;
      accents = [ catppuccin.accent ];
    };
  };

  qtTheme = {
    name = "Catppuccin-Macchiato-Blue";
    package = pkgs.catppuccin-kvantum.override {
      variant = catppuccin.flavor;
      inherit (catppuccin) accent;
    };
  };

  iconTheme = rec {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
    iconPath = "${package}/share/icons/${name}";
  };

  cursorTheme = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };

  fonts = {
    default = {
      name = "Inter";
      package = pkgs.inter;
      size = "11";
    };
    iconFont = {
      name = "Inter";
      package = pkgs.inter;
    };
    monospace = {
      name = "MesloLGSDZ Nerd Font Mono";
      package = pkgs.nerdfonts.override { fonts = [ "Meslo" ]; };
    };
    emoji = {
      name = "Joypixels";
      package = pkgs.joypixels;
    };
  };
}

# config copied from https://github.com/jnsgruk/nixos-config/blob/main/lib/theme/default.nix