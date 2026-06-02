Scan the codebase for TODO, FIXME, HACK, and XXX comments and produce a prioritized action list.

$ARGUMENTS

## Instructions

1. Search for: `TODO`, `FIXME`, `HACK`, `XXX`, `TEMP`, `BUG`, `NOTE` (case-insensitive)
2. Exclude: `node_modules/`, `.git/`, `dist/`, `build/`, `*.min.js`
3. Group by category and estimate effort (S/M/L)
4. Prioritize: FIXME/BUG > HACK > TODO > NOTE

## Search command

```bash
grep -rn --include="*.{js,ts,tsx,jsx,py,go,rb,rs,java,cs}" \
  -E "(TODO|FIXME|HACK|XXX|TEMP|BUG):" \
  --exclude-dir={node_modules,.git,dist,build} \
  .
```

## Output format

```
## TODO Audit

### 🔴 FIXME / BUG (fix soon)
- [file:line] Description (Effort: S/M/L)

### 🟡 HACK / XXX (technical debt)
- [file:line] Description (Effort: S/M/L)

### 🟢 TODO (future improvements)
- [file:line] Description (Effort: S/M/L)

**Total**: N items — S: X, M: Y, L: Z
```

If $ARGUMENTS specifies a directory or pattern, scope the search accordingly.
