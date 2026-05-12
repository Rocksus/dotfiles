{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.hyprland;
in {
  options.features.desktop.hyprland.enable = mkEnableOption "hyprland config";

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        cursor = {
          no_hardware_cursors = true;
          inactive_timeout = 0;
        };

        xwayland = {
          force_zero_scaling = true;
        };

        exec-once = [
          "waybar"
          "mako"
          "hypridle"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
          "sleep 5; bash ${config.xdg.dataFile."change_wallpaper.sh".source} &"
        ];

        env = [
          "XCURSOR_SIZE,32"
          "GTK_THEME,Dracula"
        ];

        input = {
          kb_layout = "us";
          kb_options = "ctrl:nocaps";
          follow_mouse = 1;
          sensitivity = 0;

          touchpad = {
            natural_scroll = true;
          };
        };

        general = {
          gaps_in = 5;
          gaps_out = 5;
          border_size = 1;
          "col.active_border" = "rgba(9742b5ee) rgba(9742b5ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
        };

        decoration = {
          rounding = 8;
          active_opacity = 0.9;
          inactive_opacity = 0.5;
          blur = {
            enabled = true;
            size = 3;
            passes = 3;
            new_optimizations = true;
          };
        };

        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        gestures = {
          gesture = [
            "3, horizontal, workspace"
            "3, swipe, mod: SUPER, resize"
          ];
        };

        windowrule = [
          # Float rules
          "match:class ^(file_progress)$, float 1"
          "match:class ^(confirm)$, float 1"
          "match:class ^(dialog)$, float 1"
          "match:class ^(download)$, float 1"
          "match:class ^(notification)$, float 1"
          "match:class ^(error)$, float 1"
          "match:class ^(splash)$, float 1"
          "match:class ^(confirmreset)$, float 1"
          "match:title ^(Open File)$, float 1"
          "match:title ^(branchdialog)$, float 1"
          "match:class ^(Lxappearance)$, float 1"
          "match:class ^(Wofi)$, float 1"
          "match:class ^(mako)$, float 1"
          "match:class ^(viewnior)$, float 1"
          "match:class ^(feh)$, float 1"
          "match:class ^(pavucontrol-qt)$, float 1"
          "match:class ^(pavucontrol)$, float 1"
          "match:class ^(file-roller)$, float 1"
          
          # Fullscreen and specific controls
          "match:class ^(wlogout)$, fullscreen 1"
          "match:title ^(wlogout)$, float 1"
          "match:title ^(Media viewer)$, float 1"
          "match:title ^(Volume Control)$, float 1"
          "match:title ^(Picture-in-Picture)$, float 1"
          
          # Workspace assignments
          "match:class ^(kitty)$, workspace 1"
          "match:class ^(firefox)$, workspace 2"
          "match:class ^(firefox)$, opacity 1.0"
          "match:class ^(zen-browser)$, workspace 3"
          "match:class ^(slack)$, workspace 6"
          
          # Renamed idle_inhibit (formerly idleinhibit)
          "match:class ^(firefox)$, match:fullscreen 1, idle_inhibit fullscreen"
          
          # Multi-attribute rules (Position and Size)
          "match:title ^(Volume Control)$, size 800 600"
          "match:title ^(Volume Control)$, move 75 44%"
        ];

        "$mainMod" = "SUPER";

        bind = [
          "$mainMod, return, exec, kitty"
          "$mainMod, t, exec, kitty"
          "$mainMod, grave, exec, kitten quick-access-terminal"
          "$mainMod SHIFT, e, exec, kitty"
          "$mainMod, e, exec, thunar"
          "$mainMod, Escape, exec, wlogout -p layer-shell"
          "$mainMod, Space, togglefloating"
          "$mainMod, q, killactive"
          "$mainMod, M, exit"
          "$mainMod, F, fullscreen"
          "$mainMod, V, togglefloating"
          "$mainMod, D, exec, pkill anyrun || anyrun"
          "$mainMod SHIFT, space, exec, 1password --quick-access"
          "$mainMod SHIFT, m, exec, bemoji"
          "$mainMod SHIFT, s, exec, grim -g \"$(slurp -d)\" - | wl-copy"
          "$mainMod, P, exec, wofi-pass"
          "$mainMod SHIFT, P, pseudo"
          "$mainMod, Z, exec, zen"
          "$mainMod, H, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, J, movefocus, u"
          "$mainMod, K, movefocus, d"
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
          "$mainMod SHIFT, H, workspace, e-1"
          "$mainMod SHIFT, L, workspace, e+1"

          ", XF86AudioMute, exec, pamixer -t"
          ", XF86AudioLowerVolume, exec, pamixer -d 5"
          ", XF86AudioRaiseVolume, exec, pamixer -i 5"
          ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
          ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
      };
    };
  };
}