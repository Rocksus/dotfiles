# homelab-hz

Remote homelab node (HZ region). x86_64.

## Location

`hosts/homelab-hz/`:
- `default.nix`, `configuration.nix`, `hardware-configuration.nix`, `disko-config.nix`, `secrets.nix`
- `services/`: `containers/`, `default.nix`

## Role

Newest fleet member (added in recent commits). Remote homelab compute node running containers (Podman).

## Wiring in flake

`nixosConfigurations.homelab-hz` + `homeConfigurations."rocksus@homelab-hz"`. Modules: disko, agenix.

Related: [summary.md](summary.md).
