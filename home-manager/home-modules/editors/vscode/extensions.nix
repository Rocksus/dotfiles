{pkgs, ...}: {
  programs.vscode = {
    mutableExtensionsDir = true;
    # extensions = with pkgs.vscode-marketplace; [
    # ];
  };
}
