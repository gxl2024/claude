Run the test suite and report results: $ARGUMENTS

## Instructions

1. Detect the test framework in use (Jest, Vitest, pytest, go test, etc.)
2. Run the appropriate test command
3. If a specific file/pattern is given in $ARGUMENTS, scope the run to that
4. Report results clearly

## Commands by framework

| Framework | Command |
|-----------|---------|
| Jest | `npx jest $ARGUMENTS --passWithNoTests` |
| Vitest | `npx vitest run $ARGUMENTS` |
| pytest | `python -m pytest $ARGUMENTS -v` |
| Go | `go test ./... $ARGUMENTS` |
| Ruby | `bundle exec rspec $ARGUMENTS` |
| Rust | `cargo test $ARGUMENTS` |

## Output format

```
## Test Results

**Framework**: [detected framework]
**Command**: [command run]
**Status**: ✅ Passed / ❌ Failed

**Summary**: X passed, Y failed, Z skipped

**Failures** (if any):
- [test name]: [error message]
```

If tests fail, analyze the failures and suggest fixes.
