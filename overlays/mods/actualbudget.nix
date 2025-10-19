{prev}:
prev.actual.overrideAttrs (oldAttrs: rec {
  version = "v25.10.0";

  src = prev.fetchFromGitHub {
    owner = "actualbudget";
    repo = "actual";
    rev = "${version}";
    hash = "";
  };

  pnpmDeps = prev.pnpm.fetchDeps {
    # https://nixos.org/manual/nixpkgs/stable/#javascript-pnpm-fetcherVersion
    fetcherVersion = 1;
    pname = oldAttrs.pname;
    inherit version src;
    hash = "sha256-1nH+M4UmhdyfseLwBVx+lDX5cYnAH8D944ck4u3uvXg=";
  };
})