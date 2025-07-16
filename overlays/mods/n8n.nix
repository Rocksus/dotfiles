{prev}:
prev.n8n.overrideAttrs (oldAttrs: rec {
  version = "1.102.3";

  src = prev.fetchFromGitHub {
    owner = "n8n-io";
    repo = "n8n";
    rev = "n8n@${version}";
    hash = "";
  };

  pnpmDeps = prev.pnpm.fetchDeps {
    pname = oldAttrs.pname;
    inherit version src;
    hash = "";
  };
})