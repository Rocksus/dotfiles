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
        xwayland = {
          force_zero_scaling = true;
        };

        exec-once = [
          "waybar"
          "mako"
          "hypridle"
          "wl-paste --type text --watch cliphist store" # Stores only text data
          "wl-paste --type image --watch cliphist store" # Stores only image data "wl-paste -p -t text --watch clipman store -P --histpath=\"~/.local/share/clipman-primary.json\""
          "sleep 5; bash ${config.xdg.dataFile."change_wallpaper.sh".source} &"
        ];

        env = [
          "XCURSOR_SIZE,32"
          "WLR_NO_HARDWARE_CURSORS,1"
          "GTK_THEME,Dracula"
        ];

        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_rules = "";
          kb_options = "ctrl:nocaps";
          follow_mouse = 1;

          touchpad = {
            natural_scroll = true;
          };

          sensitivity = 0;
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
          "col.shadow" = "rgba(1E202966)";
          drop_shadow = true;
          shadow_range = 60;
          shadow_offset = "1 2";
          shadow_render_power = 3;
          shadow_scale = 0.97;
          rounding = 8;
          blur = {
            enabled = true;
            size = 3;
            passes = 3;
          };
          active_opacity = 0.9;
          inactive_opacity = 0.5;
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

        master = {};

        gestures = {
          workspace_swipe = false;
        };

        windowrule = [
          "float,class:file_progress"
          "float,class:confirm"
          "float,class:dialog"
          "float,class:download"
          "float,class:notification"
          "float,class:error"
          "float,class:splash"
          "float,class:confirmreset"
          "float,title:Open File"
          "float,title:branchdialog"
          "float,class:Lxappearance"
          "float,class:Wofi"
          "float,class:mako"
          "animation:none,class:Wofi"
          "float,class:viewnior"
          "float,class:feh"
          "float,class:pavucontrol-qt"
          "float,class:pavucontrol"
          "float,class:file-roller"
          "fullscreen,class:wlogout"
          "float,title:wlogout"
          "fullscreen,title:wlogout"
          "idleinhibit:focus,class:mpv"
          "idleinhibit:fullscreen,class:firefox"
          "float,title:^(Media viewer)$"
          "float,title:^(Volume Control)$"
          "float,title:^(Picture-in-Picture)$"
          "size:800:600,title:^(Volume Control)$"
          "move:75:44%,title:^(Volume Control)$"
        ];

        "$mainMod" = "SUPER";

        bind = [
          "$mainMod, return, exec, ghostty"
          "$mainMod, t, exec, ghostty"
          "$mainMod SHIFT, e, exec, ghostty"
          "$mainMod, o, exec, thunar"
          "$mainMod, Escape, exec, wlogout -p layer-shell"
          "$mainMod, Space, togglefloating"
          "$mainMod, q, killactive"
          "$mainMod, M, exit"
          "$mainMod, F, fullscreen"
          "$mainMod, V, togglefloating"
          "$mainMod, D, exec, rofi -show drun"
          "$mainMod SHIFT, space, exec, 1password --quick-access"
          "$mainMod SHIFT, m, exec, bemoji"
          "$mainMod SHIFT, s, exec, grim -g \"$(slurp -d)\" - | wl-copy"
          "$mainMod, P, exec, wofi-pass"
          "$mainMod SHIFT, P, pseudo"
          "$mainMod, Z, exec, zen"
          "$mainMod, J, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, I, movefocus, u"
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
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"

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

        windowrulev2 = [
          "workspace=1,class:(ghostty)"
          "workspace=3,opacity=1.0,class:(firefox)"
        ];
      };
    };
  };
}
