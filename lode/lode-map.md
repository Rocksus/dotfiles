# Lode Map

Hierarchical index of all lode files. Update whenever a file is added, moved, or removed.

```
lode/
    summary.md                 # living snapshot of the whole repo
    terminology.md             # domain language
    practices.md               # repo layout, conventions, invariants
    lode-map.md                # THIS file
    plans/                     # roadmaps & TODOs (empty)
    tmp/                       # git-ignored session scraps
    flake/
        inputs.md              # flake inputs and their purpose
    hosts/
        summary.md             # host fleet overview + per-host lodes
        t480.md                # laptop host
        m920q.md               # homelab server host
        lv001.md               # lv001 host
        homelab-hz.md          # remote homelab host
    home-manager/
        summary.md             # home-manager structure & feature composition
```

## Related project files outside the lode
- `TRACKER.md` - pre-existing TODO list (T480, M920Q tasks). Superseded by `lode/plans/` for new planning.
