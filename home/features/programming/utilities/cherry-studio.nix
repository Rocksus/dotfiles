{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.programming.utilities.cherry-studio;
in {
    options.features.programming.utilities.cherry-studio.enable =
    mkEnableOption "enable cherrystudio client";

    config = mkIf cfg.enable {
        home.packages = [
          (pkgs.runCommand "cherry-studio-wrapped" { buildInputs = [ pkgs.makeWrapper ]; } ''
            mkdir -p $out/bin
            makeWrapper ${pkgs.cherry-studio}/bin/cherry-studio $out/bin/cherry-studio \
              --set LD_LIBRARY_PATH ${lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib pkgs.glibc ]}
          '')
        ];
    };
}