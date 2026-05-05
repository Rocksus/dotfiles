{ 
  config,
  lib,
  ... 
}: 
with lib; let 
  cfg = config.features.programming.utilities.opencode;
in {
  options.features.programming.utilities.opencode.enable = 
    mkEnableOption "enable opencode";

    config = mkIf cfg.enable {
      programs.opencode = {
        enable = true;

        # Toggles Model Context Protocol (MCP) integration
        # (Requires programs.mcp.servers to be configured separately)
        enableMcpIntegration = true;

        tui = {
          theme = "catppuccin-mocha";
          keybindings = {
            cancel = "ctrl+c";
          };

          commands = {
            commit = ''
              Generate a conventional commit message based on the staged changes.
              Usage: /commit
            '';
          };
        };
      };
    };
}