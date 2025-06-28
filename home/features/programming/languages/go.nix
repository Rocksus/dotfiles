{
  config,
  pkgs,
  ...
}: {
  programs.go = rec {
    enable = true;
    goPath = ".go";
    goBin = "${goPath}/bin";
  };

  home = {
    packages = with pkgs; [
      golangci-lint
      gotools
      delve
      impl
      revive
    ];

    sessionPath = ["${config.home.homeDirectory}/${config.programs.go.goBin}"];
  };
}