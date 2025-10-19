{prev}:
prev.actual.overrideAttrs (oldAttrs: rec {
  version = "v25.10.0";

  src = prev.fetchFromGitHub {
    owner = "actualbudget";
    repo = "actual";
    rev = "${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  nativeBuildInputs = [
    prev.nodejs
    prev.yarn-berry_4.yarnBerryConfigHook
  ];

  # https://nixos.org/manual/nixpkgs/stable/#javascript-yarn-v3-v4
  offlineCache = prev.yarn-berry_4.fetchYarnBerryDeps {
    inherit (oldAttrs) src;
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
})