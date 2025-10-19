{prev}:
prev.actual-server.overrideAttrs (oldAttrs: rec {
  version = "v25.10.0";

  src = prev.fetchFromGitHub {
    owner = "actualbudget";
    repo = "actual";
    rev = "${version}";
    hash = "";
  };

  # https://nixos.org/manual/nixpkgs/stable/#javascript-yarn-v3-v4
  offlineCache = prev.yarn-berry.fetchYarnBerryDeps {
    inherit (oldAttrs) src;
    hash = "";
  };
})