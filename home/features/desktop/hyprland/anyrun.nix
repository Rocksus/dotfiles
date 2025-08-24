{ config, pkgs, lib, inputs, ... }:
with lib; let
  cfg = config.features.desktop.anyrun;
in {
  options.features.desktop.anyrun.enable = mkEnableOption "enable anyrun";

  config = mkIf cfg.enable {
    programs.anyrun = {
      enable = true;

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
          # An array of all the plugins you want, which either can be paths to the .so files, or their packages
          inputs.anyrun.packages.${pkgs.system}.applications
        ];
      };

      extraCss = /* css */ ''
        /* --- Tokens (keep yours or these) --- */
        @define-color accent  #7c3aed;
        @define-color fg      #e6e7eb;
        @define-color muted   #9aa0a6;
        @define-color bg      rgba(15,15,18,0.86);
        @define-color border  rgba(255,255,255,0.10);

        /* --- Shell --- */
        #window { background: transparent; }
        #main {
          background: @bg;
          border: 1px solid @border;
          border-radius: 16px;
          padding: 14px;
          box-shadow: 0 18px 60px rgba(0,0,0,0.45), 0 4px 16px rgba(0,0,0,0.35);
        }

        /* --- Entry --- */
        #entry {
          background: rgba(255,255,255,0.06);
          border: 1px solid @border;
          border-radius: 12px;
          padding: 10px 12px;
          margin-bottom: 10px;
          color: @fg;
          caret-color: @accent;
          font: 12.5pt "Inter","SF Pro Text","Segoe UI",Roboto,sans-serif;
        }
        #entry:focus { border-color: alpha(@accent,0.65); box-shadow: 0 0 0 3px alpha(@accent,0.18); }

        /* --- FIX THE WHITE SLAB (results container) --- */
        /* Make all list containers transparent/dark */
        scrolledwindow,
        scrolledwindow > viewport,
        list,
        listview,
        treeview,
        #matches {
          background: transparent;
          border: none;
        }

        /* Optional: give the results area a subtle dark panel */
        #main > box:last-child {
          background: rgba(255,255,255,0.03);
          border: 1px solid @border;
          border-radius: 12px;
          padding: 6px;
        }

        /* --- Rows --- */
        #match {
          padding: 10px;
          border-radius: 10px;
          background: transparent;
        }
        #match:hover    { background: alpha(@accent, 0.08); }
        #match:selected { background: alpha(@accent, 0.18); }

        #match-title { color: @fg;   font: 11.5pt "Inter","SF Pro Text","Segoe UI",Roboto,sans-serif; }
        #match-desc  { color: @muted; font-size: 10pt; }

        /* Icons */
        #match image, #plugin image { margin-right: 8px; opacity: 0.95; }
      '';
    };
  };
}
