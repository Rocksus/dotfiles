{prev}:
prev.actual-server.overrideAttrs (oldAttrs: rec {
  version = "v25.12.0";

  src = prev.fetchFromGitHub {
    owner = "actualbudget";
    repo = "actual";
    rev = "${version}";
    hash = "sha256-Skpfhhxd8MUoVpwPv4j8/bnFYYEAJkjKN2g1HVwWH/w=";
  };

  missingHashes = ./missing-hashes.json;
  # https://nixos.org/manual/nixpkgs/stable/#javascript-yarn-v3-v4
  offlineCache = prev.yarn-berry.fetchYarnBerryDeps {
    inherit (oldAttrs) src missingHashes;
    hash = "sha256-Hlc/UMPfZCBbBcmCzmNgDSX+uH8WDEIp/KE9H5jYr2Y=";
  };
})