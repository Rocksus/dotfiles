{prev}:
prev.actual-server.overrideAttrs (oldAttrs: rec {
  version = "v25.12.0";

  src = prev.fetchFromGitHub {
    owner = "actualbudget";
    repo = "actual";
    rev = "${version}";
    hash = "sha256-hu5Y67vomAJI1IJ1gLAdapRACDW/Q+cOAB+Bo4uQ9+w=";
  };

  missingHashes = ./missing-hashes.json;
  # https://nixos.org/manual/nixpkgs/stable/#javascript-yarn-v3-v4
  offlineCache = prev.yarn-berry.fetchYarnBerryDeps {
    inherit (oldAttrs) src missingHashes;
    hash = "";
  };
})