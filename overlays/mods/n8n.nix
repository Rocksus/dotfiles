{prev}:
prev.n8n.overrideAttrs (oldAttrs: rec {
  version = "1.121.3";

  src = prev.fetchFromGitHub {
    owner = "n8n-io";
    repo = "n8n";
    rev = "n8n@${version}";
    hash = "sha256-kBRMyO7J+I8VUns5GX27whCxNcsemP/OCCNRxZxcjuI=";
  };

  pnpmDeps = prev.pnpm.fetchDeps {
    # https://nixos.org/manual/nixpkgs/stable/#javascript-pnpm-fetcherVersion
    fetcherVersion = 1;
    pname = oldAttrs.pname;
    inherit version src;
    hash = "sha256-1nH+M4UmhdyfseLwBVx+lDX5cYnAH8D944ck4u3uvXg=";
  };
})