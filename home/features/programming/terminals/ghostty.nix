{
  pkgs,
  inputs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.system}.default; # the latest version

    enableZshIntegration = true;
    # clearDefaultKeybindings = true;
    # installVimSyntax = true;

    settings = {
      # theme = "catppucin-macchiato";
      font-family = "Maple Mono NF CN";
      font-size = 11;

      background-opacity = 0.93;
      # only supported on macOS;

      keybind = [
        # TODO: figure out how to properly use this globally
        # "global:super+grave_accent=toggle_quick_terminal"
        "super+c=copy_to_clipboard"
        "super+shift+h=goto_split:left"
        "super+shift+j=goto_split:bottom"
        "super+shift+k=goto_split:top"
        "super+shift+l=goto_split:right"
        "ctrl+page_up=jump_to_prompt:-1"
      ];

      # https://ghostty.org/docs/config/reference#command
      #  To resolve issues:
      #    1. https://github.com/ryan4yin/nix-config/issues/26
      #    2. https://github.com/ryan4yin/nix-config/issues/8
      # command = "zellij";
    };
  };
}
