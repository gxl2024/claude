Perform a thorough code review of: $ARGUMENTS

If no argument is provided, review the current branch diff against main.

## Review checklist

### Correctness
- [ ] Logic is correct for happy path and edge cases
- [ ] No off-by-one errors, null dereferences, or type mismatches
- [ ] Async/await and error handling are correct
- [ ] State mutations are intentional and safe

### Security
- [ ] No SQL/command/XSS injection vectors
- [ ] Authentication and authorization are enforced
- [ ] Sensitive data is not logged or exposed
- [ ] Dependencies are not introducing known vulnerabilities

### Performance
- [ ] No N+1 query patterns
- [ ] Expensive operations are not in loops or hot paths
- [ ] Appropriate caching where needed

### Maintainability
- [ ] Functions/methods have single responsibility
- [ ] Naming clearly expresses intent
- [ ] No magic numbers or unexplained constants
- [ ] Tests cover the new behavior

## Output format

Rate each category: ✅ Good / ⚠️ Minor issues / ❌ Critical issues

List findings as: `[file:line] Severity: Description. Suggestion: ...`
