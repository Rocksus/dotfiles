{
  pkgs,
  inputs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.system}.default; # the latest version
    enableBashIntegration = false;
    installBatSyntax = false;
    # installVimSyntax = true;

    settings = {
      theme = "catppuccin-mocha";

      font-family = "Maple Mono NF CN";
      font-size = 13;

      background-opacity = 0.93;
      # only supported on macOS;

      # https://ghostty.org/docs/config/reference#command
      #  To resolve issues:
      #    1. https://github.com/ryan4yin/nix-config/issues/26
      #    2. https://github.com/ryan4yin/nix-config/issues/8
      command = "fastfetch";
    };
  };
}