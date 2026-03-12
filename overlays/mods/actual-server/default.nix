{prev}:
prev.actual-server.overrideAttrs (oldAttrs: rec {
  version = "v26.2.1";

  src = prev.fetchFromGitHub {
    owner = "actualbudget";
    repo = "actual";
    rev = "${version}";
    hash = "sha256-8cRt1WKa4Yp6rE2Jzko0rKJoCp7+KSzVdtKcv/aKK8o=";
  };

  missingHashes = ./missing-hashes.json;
  # https://nixos.org/manual/nixpkgs/stable/#javascript-yarn-v3-v4
  offlineCache = prev.yarn-berry.fetchYarnBerryDeps {
    inherit (oldAttrs) src missingHashes;
    hash = "sha256-7ZZGtwQM9+odozLi95MFshNjde3oFTgWkgimj8Ei2W8=";
  };
})