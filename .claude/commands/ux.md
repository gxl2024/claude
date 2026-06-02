Perform a UX review of: $ARGUMENTS

If no argument, review the most recently changed UI files.

## UX review dimensions

### Usability
- Is the primary action obvious on each screen?
- Are error messages clear about what went wrong AND what to do next?
- Is form validation helpful and non-blocking?
- Are loading and empty states handled?

### Accessibility
- Do all images have meaningful alt text?
- Is color contrast sufficient (≥4.5:1 for text)?
- Can all interactions be completed with keyboard alone?
- Are form inputs properly labeled?
- Are focus states visible?

### Consistency
- Does terminology match elsewhere in the product?
- Are spacing, typography, and color consistent with the design system?
- Do similar actions behave the same way across the UI?

### Content & Copy
- Is the language clear, concise, and action-oriented?
- Are CTAs specific (not just "Submit" or "Click here")?
- Are instructions written in plain language?

## Output format

```
## UX Review: [component/page]

### Summary
[2-3 sentence overview]

### Issues Found

| Severity | Location | Issue | Recommendation |
|----------|----------|-------|----------------|
| Critical | [location] | [problem] | [fix] |
| Major    | [location] | [problem] | [fix] |
| Minor    | [location] | [problem] | [fix] |

### Positive Observations
- [what's working well]
```
