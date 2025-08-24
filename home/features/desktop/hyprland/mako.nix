{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.mako;
in {
  options.features.desktop.mako.enable =
    mkEnableOption "install mako for hyprland notification daemon";

  config = mkIf cfg.enable {
    services.mako = {
      enable = true;

      settings = {
        font                 = "FiraCode Nerd Font 12";
        width                = 340;
        height               = 160;
        "default-timeout"    = 4000;

        # Layout & placement
        anchor               = "top-right";
        layer                = "overlay";           # keep above fullscreen
        "max-visible"        = 6;
        "group-by"           = "app-name,summary";  # collapse spammy dupes
        "text-alignment"     = "left";
        margin               = 10;                  # gap between stacked toasts
        "outer-margin"       = "10,20,20,10";       # screen edge insets (t,r,b,l)
        padding              = 12;

        # Colors & shape
        "background-color"   = "#2E3440E6";         # Nord polar night @ ~90% opacity
        "text-color"         = "#ECEFF4";           # Nord snow
        "border-color"       = "#81A1C1";           # Nord frost
        "border-size"        = 2;
        "border-radius"      = 12;

        # Icons & progress
        icons                = 1;
        "icon-location"      = "left";
        "max-icon-size"      = 48;
        "icon-border-radius" = 8;
        "progress-color"     = "source #81A1C1AA";  # shows nicely on semi-transparent bg

        # Markup & history
        markup               = 1;                   # enable Pango markup
        history              = 1;

        # Rich, compact text layout: bold summary, faint app, then body
        format = lib.concatStringsSep "\\n" [
          "<b>%s</b>"
          "<span size=\"smaller\">%a</span>"
          "%b"
        ];


        # Urgency accents
        "urgency=low" = {
          "border-color" = "#A3BE8C";              # green edge
        };
        "urgency=normal" = {
          "border-color" = "#81A1C1";              # frost (default)
        };
        "urgency=critical" = {
          "border-color"   = "#BF616A";            # red edge
          "border-size"    = 3;
          "default-timeout"= 0;                    # persist until dismissed
          format = lib.concatStringsSep "\\n" [
            "🔥 <b>%s</b>"
            "<span size=\"smaller\">%a</span>"
            "%b"
          ];
        };

        # One-tap actions (mouse)
        "on-button-left"   = "invoke-default-action";
        "on-button-right"  = "dismiss";
        "on-button-middle" = "dismiss-all";

        # Quick DND mode (toggle with: makoctl mode -t do-not-disturb)
        "mode=do-not-disturb" = { invisible = 1; };
      };
    };
  };
}
