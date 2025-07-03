{
  programs.vscode.profiles.default.keybindings = [
    {
      key = "ctrl+`";
      command = "workbench.action.terminal.focus";
      when = "editorTextFocus";
    }
    {
      key = "ctrl+`";
      command = "workbench.action.focusActiveEditorGroup";
      when = "terminalFocus";
    }
    {
      key = "alt+shift+f";
      command = "editor.action.formatDocument";
      when = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
    }
    {
      key = "alt+left";
      command = "workbench.action.navigateBack";
    }
    {
      key = "alt+right";
      command = "workbench.action.navigateForward";
    }
  ];
}