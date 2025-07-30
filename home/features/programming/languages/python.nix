{pkgs, ...}: {
  home.packages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        pip
        virtualenv
      ]))

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