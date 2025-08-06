{pkgs, ...}: {
  home.packages = with pkgs; [
    (python310.withPackages (ps:
      with ps; [
        pip
        virtualenv
      ]))

    libffi
    pkg-config
    meson
    ninja
    rustc
    libffi

    pipenv
    poetry
  ];

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.libffi}/lib/pkgconfig";
  };
}