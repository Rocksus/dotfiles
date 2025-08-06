{pkgs, ...}: {
  home.packages = with pkgs; [
    (python311.withPackages (ps:
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