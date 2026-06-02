Implement the following using Test-Driven Development (TDD): $ARGUMENTS

## TDD cycle

Follow Red → Green → Refactor strictly:

### 1. RED — Write a failing test first
- Write the simplest test that describes the desired behavior
- Run it and confirm it fails (and fails for the right reason)
- Do NOT write implementation code yet

### 2. GREEN — Make it pass with minimal code
- Write the simplest implementation that makes the test pass
- Don't over-engineer — just make it green
- Run the test suite and confirm all tests pass

### 3. REFACTOR — Improve without breaking
- Clean up the code while keeping tests green
- Remove duplication, improve naming, extract functions
- Run tests after every change

## Rules
- Never write implementation before a failing test exists
- One test at a time — don't batch multiple failing tests
- Tests should be fast, isolated, and deterministic
- Use the testing framework already in the project

## Starting prompt

Begin by asking: "What is the simplest behavior I can test first?" Then write that test.
