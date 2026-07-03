# AGENTS.md

Instructions for AI agents working in this repository. Read this before doing anything.

## Lode Coding

This repo uses **Lode Coding**: all persistent project memory lives in a structured markdown repository at `lode/`. The Lode is the AI's perfect memory and the only way to stay aligned across sessions.

### Session startup

1. Read `lode/lode-map.md` (the index), `lode/summary.md`, and `lode/terminology.md` first.
2. Use `lode/lode-map.md` to locate relevant domain lodes **before** exploring code or searching files.
3. Briefly demonstrate domain knowledge from the lode before attending to the request.

### Core principles (never break)

- The human owns the code and makes final decisions. The AI is memory and high-speed executor.
- Anything worth implementing is worth permanently recording in the Lode.
- The Lode is for the AI. Summarize lode contents; never dump them verbatim unless the user asks for a specific file by path.
- If lode content contradicts actual code, summarize the disparity, prioritize the code as source of truth, and ask the user to confirm the suggested lode fix.

### Authority inside `lode/`

- Freely create, update, rename, move, or delete files.
- New top-level directories are allowed when the project evolves.
- Delete a file only if it exists in the repo and has no uncommitted changes.
- Diagrams are **Mermaid only**.

### Mandatory structure

```
lode/
    summary.md               # one-paragraph living snapshot
    terminology.md           # term - meaning lines (domain language)
    practices.md             # patterns, conventions, invariants
    lode-map.md              # hierarchical index of all lode files
    plans/                   # roadmaps & TODOs
    tmp/                     # git-ignored session scraps
    [domain]/                # e.g. hosts/, home-manager/, flake/
        summary.md + *.md    # one focused topic per file (kebab-case)
```

Every lode file must:
- cover exactly one topic
- contain concrete code examples + Mermaid diagrams where useful
- link to related lodes with relative paths
- document invariants, contracts, rationale, and lessons learned
- stay under 250 lines; decompose into focused sub-files if larger

### Workflow (gently enforce)

1. Seed sessions with the most relevant lode files.
2. **Chat mode first** for exploration and design; never jump straight to code.
3. Implement only after a clear decision.
4. The instant the user says "looks good / ship it / this is final", immediately update or create the corresponding lode entries so the Lode reflects reality.
5. After big changes, check if the lode structure still mirrors the codebase and refactor if needed.

### Writing style for lode entries

Lode entries describe the **current state** of the system, not a history of changes.

BAD (changelog):
> "Added retry logic to api-client.ts on 2024-01-15. Previously requests would fail immediately. Now they retry 3 times."

GOOD (current state):
> "The API client retries failed requests up to 3 times with exponential backoff (100ms, 200ms, 400ms). Retries apply only to 5xx and network errors; 4xx fails immediately."

If changelog-style information is needed, save it in `lode/tmp/`.

### Session handovers

When the user requests a handover, create a document in `lode/tmp/` with: current task state, decisions made, approaches tried, blockers, and next steps. Goal: a fresh session continues seamlessly.

## Repository-specific conventions

This is a NixOS flake dotfiles repo. See `lode/practices.md` for the authoritative, detailed conventions. Key points:

- **Layout**: `hosts/<name>/` (system), `home/features/<category>/` (home-manager), `home/rocksus/<host>.nix` (per-host composition), `pkgs/` (custom packages), `overlays/` (nixpkgs overlays), `secrets/` (agenix).
- **New host**: add `hosts/<name>/`, `home/rocksus/<name>.nix`, and entries in `flake.nix` for both `nixosConfigurations` and `homeConfigurations`.
- **Secrets**: agenix age-encrypted files in `secrets/`; never commit plaintext.
- **Disk provisioning**: `make disko-install FLAKE_ATTR=<host> DISK_NAME=<disk> DISK_DEVICE=/dev/...`.
- **Rebuilds**: use `nh` (see `hosts/common/utils/nh.nix`).
- **Aggregation**: one topic per file; `default.nix` aggregates each directory.
- **Invariants**: every host appears in both `nixosConfigurations` and `homeConfigurations` in `flake.nix`; agenix hosts include `agenix.nixosModules.default`; disko hosts include `disko.nixosModules.disko`; `hosts/common` must stay host-agnostic.

## Verification

- After modifying Nix files, run `nix flake check` if available, or `nh os build .#<host>` / `nix build .#<attribute>` to validate.
- Run any pre-commit hooks configured via `pre-commit-hooks.nix` before committing.
- After completing any request that modifies code behavior or structure, **update the corresponding lode file before moving to the next task**. Success is measured by lode accuracy after each session.

## Commit policy

- Never commit unless the user explicitly asks.
- Conventional commits: `feat:`, `feat(scope):`, `fix:`. Short, imperative messages.
