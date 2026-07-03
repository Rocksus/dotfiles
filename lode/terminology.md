# Terminology

- **flake** - Nix flake (`flake.nix`); the entry point declaring all inputs and outputs (hosts + home configurations).
- **nixpkgs / nixpkgs-stable** - Two nixpkgs channels: `nixos-unstable` (default) and `nixos-25.11` (stable, pinned).
- **host** - A NixOS machine defined under `hosts/<name>`; wired into `flake.nix` as a `nixosConfigurations.<name>`.
- **home-manager** - Declarative user-environment manager; one `homeConfigurations."rocksus@<host>"` per host.
- **disko** - Declarative disk partitioning; each host has `disko-config.nix` and is installed via `make disko-install`.
- **agenix** - Secret management via age-encrypted files; secrets live in `secrets/` and are referenced through `secrets.nix` per host.
- **feature module** - A self-contained home-manager module under `home/features/<category>/<feature>.nix`, aggregated by `default.nix`.
- **common** - Shared modules reused across hosts (`hosts/common`) or across home configs (`home/common`).
- **overlay** - Nixpkgs overlay in `overlays/` (with per-package mods in `overlays/mods/`) used to patch or add packages.
- **nh** - Nix helper tool (`hosts/common/utils/nh.nix`) used as the rebuild wrapper.
- **Hyprland** - Wayland compositor configured under `home/features/desktop/hyprland/`.
- **homelab-hz** - A remote NixOS host added to the homelab fleet (HZ region).
