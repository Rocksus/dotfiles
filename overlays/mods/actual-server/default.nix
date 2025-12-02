{prev}:
prev.actual-server.overrideAttrs (oldAttrs: rec {
  version = "v25.11.0";

  src = prev.fetchFromGitHub {
    owner = "actualbudget";
    repo = "actual";
    rev = "${version}";
    hash = "sha256-VzILbBm1et5YVkbNPUtZT9ne+XuKSooOjk8rUybWkaM=";
  };

  missingHashes = ./missing-hashes.json;
  # https://nixos.org/manual/nixpkgs/stable/#javascript-yarn-v3-v4
  offlineCache = prev.yarn-berry.fetchYarnBerryDeps {
    inherit (oldAttrs) src missingHashes;
    hash = "sha256-Vod0VfoZG2nwnu35XLAPqY5uuRLVD751D3ZysD0ypL0=";
  };
})