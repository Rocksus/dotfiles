{ config, pkgs, lib, inputs, ... }:
with lib; let
  cfg = config.features.desktop.anyrun;
in {
  options.features.desktop.anyrun.enable = mkEnableOption "enable anyrun";

  config = mkIf cfg.enable {
    programs.anyrun = {
      enable = true;

      # keep your existing plugins/config; shown here for context only
      config = {
        x.fraction = 0.50;
        y.fraction = 0.28;
        width.fraction = 0.34;   # supports { fraction = float; } per HM docs
        layer = "overlay";
        showResultsImmediately = true;
        hidePluginInfo = false;
        ignoreExclusiveZones = false;
        maxEntries = 12;
        plugins = [
          # e.g. inputs.anyrun.packages.${pkgs.system}.applications
        ];
      };

      extraCss = /* css */ ''
        /* ---------- Theme tokens ---------- */
        @define-color accent     #7c3aed;                  /* violet */
        @define-color fg         #e6e7eb;                  /* foreground text */
        @define-color muted      #9aa0a6;                  /* secondary text */
        @define-color bg         rgba(15, 15, 18, 0.82);   /* panel backdrop */
        @define-color bg-weak    rgba(255,255,255,0.05);   /* input bg */
        @define-color border     rgba(255,255,255,0.10);   /* hairline */

        /* ---------- Window & panel ---------- */
        #window {
          background: transparent; /* let the panel draw its own rounded bg */
        }

        #main {
          background: @bg;
          padding: 14px;
          border-radius: 16px;
          border: 1px solid @border;
          box-shadow:
            0 18px 60px rgba(0,0,0,0.45),
            0  4px 16px rgba(0,0,0,0.35);
        }

        /* ---------- Entry (search box) ---------- */
        #entry {
          background: @bg-weak;
          border: 1px solid @border;
          border-radius: 12px;
          padding: 10px 12px;
          margin-bottom: 10px;
          font: 12.5pt "Inter", "SF Pro Text", "Segoe UI", Roboto, sans-serif;
          color: @fg;
          caret-color: @accent;
        }
        #entry:focus {
          border: 1px solid alpha(@accent, 0.65);
          box-shadow: 0 0 0 3px alpha(@accent, 0.18);
        }

        /* ---------- Plugin header ---------- */
        #plugin > label {
          color: @muted;
          font-weight: 600;
          letter-spacing: 0.2px;
          padding: 6px 2px 4px 2px;
        }

        /* ---------- Matches list ---------- */
        #match {
          padding: 10px 10px;
          border-radius: 10px;
          background: transparent;
        }
        #match:hover {
          background: alpha(@accent, 0.08);
        }
        #match:selected {
          background: alpha(@accent, 0.18);
          outline: none;
        }

        #match-title {
          color: @fg;
          font: 11.5pt "Inter", "SF Pro Text", "Segoe UI", Roboto, sans-serif;
        }
        #match-desc {
          color: @muted;
          font-size: 10pt;
        }

        /* ---------- Icons ---------- */
        #match image, #plugin image {
          margin-right: 8px;
          opacity: 0.95;
          -gtk-icon-transform: scale(1.0);
        }

        /* ---------- Optional density tweaks ----------
          Uncomment one block to change size profile.
        */
        /* Compact
        #main { padding: 10px; }
        #entry { padding: 8px 10px; }
        #match { padding: 8px 8px; }
        */

        /* Roomy
        #main { padding: 18px; }
        #entry { padding: 12px 14px; }
        #match { padding: 12px 12px; }
        */

        /* ---------- Optional OLED-dark ----------
          Swap the panel background for deeper black.
        */
        /* #main { background: rgba(0,0,0,0.88); } */
      '';
    };
  };
}
