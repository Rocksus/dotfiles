# Practices

## Repo layout

```
flake.nix            # inputs + nixosConfigurations + homeConfigurations
flake.lock
hosts/
    common/          # shared system modules (config, users, utils)
    <name>/          # per-host: configuration.nix, default.nix, disko-config.nix,
                     #   hardware-configuration.nix, secrets.nix, services/
home/
    common/          # shared home-manager module
    features/        # categorized feature modules (cli, desktop, editors, programming, browsers, design)
    rocksus/         # per-host home entry: <host>.nix composing features
pkgs/                # custom packages (default.nix exports per-system packages)
overlays/            # nixpkgs overlays + mods/
secrets/             # agenix age-encrypted secret files
secrets.nix          # root secrets wiring
Makefile             # link + disko-install targets
```

## Conventions

- One topic per file; aggregate via `default.nix` in each directory.
- Per-host entry files (`hosts/<name>/default.nix`, `home/rocksus/<host>.nix`) compose common + feature modules.
- New hosts require three additions: `hosts/<name>/`, `home/rocksus/<name>.nix`, and entries in `flake.nix` for both `nixosConfigurations` and `homeConfigurations`.
- Secrets: define age file in `secrets/`, reference via agenix module in host `secrets.nix`. Never commit plaintext.
- Disk provisioning: write `disko-config.nix`, then `make disko-install FLAKE_ATTR=<host> DISK_NAME=<disk> DISK_DEVICE=/dev/...`.
- Rebuilds use `nh` (see `hosts/common/utils/nh.nix`).

## Commit style

Conventional commits: `feat:`, `feat(scope):`, `fix:`. Scopes observed: `hyprland`, `opencode`, `actual`. Keep messages short and imperative.

## Invariants

- `flake.nix` must enumerate every host in both `nixosConfigurations` and `homeConfigurations`.
- Every host using agenix must include `agenix.nixosModules.default`.
- Every host using disko must include `disko.nixosModules.disko`.
- `hosts/common` modules are imported by all hosts; do not put host-specific behavior there.
