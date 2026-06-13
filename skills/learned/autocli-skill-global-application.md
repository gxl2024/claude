# AutoCLI Skill Global Application Pattern

**Extracted:** 2026-06-13
**Context:** Claude Code plugin architecture — applies when creating or promoting skills for cross-project reuse

## Problem

Skills defined inside a project directory (`<project>/.claude/skills/`) are only available when working in that project. When a skill is genuinely useful across multiple codebases (e.g., CLI automation, coding standards, security checks), it needs to be globally accessible.

## Solution

Place the skill in `~/.claude/skills/[skill-name]/SKILL.md` with the following structure:

```
~/.claude/skills/
└── [skill-name]/
    └── SKILL.md          ← frontmatter + content
```

Frontmatter format:

```yaml
---
name: skill-name
description: One-sentence description for skill routing
origin: ECC              # or: learned, custom, etc.
---
```

Critical sections:
1. **When to Activate** — universal trigger conditions (no project-specific references)
2. Content — patterns, examples, checklists

## Promotion Workflow

To promote a project-scoped instinct to global scope:

```bash
/promote [instinct-id]              # promote specific instinct
/promote --dry-run                  # preview candidates
/evolve --generate                  # cluster instincts → skills/commands/agents
```

Promoted instincts land at: `~/.claude/homunculus/instincts/personal/` with `scope: global`

Learned skills extracted via `/learn` go to: `~/.claude/skills/learned/`

## Skill Placement Policy

| Location | Scope | Use When |
|---|---|---|
| `<project>/.claude/skills/` | Project-local | Specific to one codebase |
| `~/.claude/skills/` | Global | Reusable across all projects |
| `~/.claude/skills/learned/` | Global (auto-generated) | Extracted by `/learn` |
| `~/.claude/homunculus/` | Global (instinct-based) | Promoted via `/promote` |

## When to Use

- A skill is used in 2+ separate projects without modification
- A coding pattern, CLI tool, or workflow is project-agnostic
- You want a skill available in any Claude Code session without copying files
- Triggered after `/learn` identifies a reusable pattern worth globalizing
