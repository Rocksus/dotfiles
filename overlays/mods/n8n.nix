{prev}:
prev.n8n.overrideAttrs (oldAttrs: rec {
  version = "2.15.0";

  src = prev.fetchFromGitHub {
    owner = "n8n-io";
    repo = "n8n";
    rev = "n8n@${version}";
    hash = "sha256-TOIJqLa68ibry9LSqMkHrJJ+v9t2bK2ybNPUDdiJ66Q=";
  };

  pnpmDeps = prev.pnpm.fetchDeps {
    # https://nixos.org/manual/nixpkgs/stable/#javascript-pnpm-fetcherVersion
    fetcherVersion = 3;
    pname = oldAttrs.pname;
    inherit version src;
    hash = "sha256-h1f95sVdgxSUeTKaby7IYG/YOPZ+Eqd/WCuC8Ge0GTs=";
  };
})
