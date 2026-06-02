Create a pull request for the current branch.

## Instructions

1. Run `git log main..HEAD --oneline` to see commits on this branch
2. Run `git diff main...HEAD --stat` to see changed files
3. Summarize the changes into a clear PR title and description
4. Create the PR as a draft using the GitHub MCP tools

## PR format

**Title**: Short, imperative, ≤70 chars (e.g. "Add user authentication flow")

**Body**:
```markdown
## Summary
- Bullet points describing what changed and why

## Changes
- List of significant files/components modified

## Test plan
- [ ] Specific things to verify manually
- [ ] Edge cases to check

## Screenshots (if UI changes)
[attach if applicable]
```

## Rules
- Title uses imperative mood ("Add", "Fix", "Update", not "Added", "Fixed")
- Summary explains the WHY, not just the what
- Test plan must be actionable and specific
- Create as draft — do not merge automatically
