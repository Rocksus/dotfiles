{prev}:
prev.n8n.overrideAttrs (oldAttrs: rec {
  version = "1.102.3";

  src = prev.fetchFromGitHub {
    owner = "n8n-io";
    repo = "n8n";
    rev = "n8n@${version}";
    hash = "sha256-s8om1FcTakYdbE4Ai4Me6/p0A0tPHsS8PP4aJDvk6qs=";
  };

  pnpmDeps = prev.pnpm.fetchDeps {
    # https://nixos.org/manual/nixpkgs/stable/#javascript-pnpm-fetcherVersion
    fetcherVersion = 1;
    pname = oldAttrs.pname;
    inherit version src;
    hash = "sha256-1nH+M4UmhdyfseLwBVx+lDX5cYnAH8D944ck4u3uvXg=";
  };
})