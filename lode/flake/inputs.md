# Flake Inputs

Current state of inputs declared in `flake.nix`.

## Inputs

| Input | Purpose | Notes |
|---|---|---|
| `nixpkgs` | Primary package source | `nixos-unstable` channel |
| `nixpkgs-stable` | Pinned stable channel | `nixos-25.11` |
| `home-manager` | User environment | follows `nixpkgs` |
| `disko` | Declarative disk partitioning | follows `nixpkgs`; used by all hosts |
| `pre-commit-hooks` | Git pre-commit hooks | follows `nixpkgs` |
| `zen-browser` | Zen browser flake | `MarceColl/zen-browser-flake` |
| `ghostty` | Ghostty terminal | `ghostty-org/ghostty`; does NOT follow nixpkgs |
| `agenix` | Secret management | follows `nixpkgs`; age-encrypted secrets |
| `rust-overlay` | Rust toolchain overlay | follows `nixpkgs` |
| `swww` | Wallpaper daemon | `LGFae/swww` |
| `affinity-nix` | Affinity Designer/Photo | `mrshmllow/affinity-nix` |
| `authentik-nix` | Authentik identity provider | **does NOT follow `nixpkgs`** (uses its own pinned nixpkgs); only on `m920q`; currently tracking authentik `2026.5.3` |

## Invariants

- `authentik-nix` must NOT have `inputs.nixpkgs.follows = "nixpkgs"`. Its `buildGo125Module`-based `gopkgs` derivation pins a `vendorHash` that is a fixed-output derivation (FOD) hash validated against authentik-nix's **own** pinned nixpkgs. Following a different nixpkgs changes `goModules` FOD content (the Go module fetcher/vendoring logic in nixpkgs evolves) and breaks the build with a `vendorHash` mismatch on `authentik-gopkgs-<version>-go-modules`. Lesson learned 2026-07-04: bumping authentik-nix while keeping `follows` reproduced the same class of drift even on the latest input, because authentik-nix's tested nixpkgs (~June) was newer than the root nixpkgs (~Feb); only dropping `follows` made the FOD reproducible.

## Outputs

- `packages` - per-system custom packages from `./pkgs` (aarch64-linux, i686-linux, x86_64-linux, aarch64-darwin, x86_64-darwin).
- `overlays` - from `./overlays`.
- `nixosConfigurations` - `t480`, `m920q`, `lv001`, `homelab-hz`. Each gets `{inputs, outputs}` as specialArgs and includes `disko` + `agenix` modules. `m920q` additionally includes `authentik-nix`.
- `homeConfigurations` - one per `rocksus@<host>` for all four hosts.

## Mermaid: host -> modules

```mermaid
graph TD
    flake[flake.nix]
    flake -->|nixosSystem| t480
    flake -->|nixosSystem| m920q
    flake -->|nixosSystem| lv001
    flake -->|nixosSystem| homelabhz[homelab-hz]
    flake -->|homeManagerConfiguration| ht480[rocksus@t480]
    flake -->|homeManagerConfiguration| hm920q[rocksus@m920q]
    flake -->|homeManagerConfiguration| hlv001[rocksus@lv001]
    flake -->|homeManagerConfiguration| hhz[rocksus@homelab-hz]

    t480 --> disko & agenix
    m920q --> disko & agenix & authentik
    lv001 --> disko & agenix
    homelabhz --> disko & agenix
```

Related: [../hosts/summary.md](../hosts/summary.md), [../home-manager/summary.md](../home-manager/summary.md).
