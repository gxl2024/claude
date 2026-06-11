# Claude Code ECC Plugin

Battle-tested agents, skills, commands, hooks, and MCP configs for Claude Code.

## What's Included

| Component | Description |
|-----------|-------------|
| **Skill Creator** (`/skill-create`) | Analyzes git history → generates SKILL.md that teaches Claude your team's patterns |
| **MCP Builder** (`mcp-configs/`) | Ready-to-use MCP server configs: filesystem, GitHub, search, memory, fetch |
| **70+ commands** | `/plan`, `/code-review`, `/tdd`, `/build-fix`, `/learn`, and more |
| **182 skills** | Domain knowledge from TDD to security to cloud patterns |
| **Agents** | Specialized subagents: planner, reviewer, tdd-guide, etc. |
| **Rules** | Always-on guidelines: coding style, security, testing, performance |

---

## Install on Your Computer

### macOS / Linux

```bash
git clone https://github.com/gxl2024/claude.git ~/claude-ecc
cd ~/claude-ecc
./install.sh typescript        # swap for: python golang web swift php
```

### Windows (PowerShell)

```powershell
git clone https://github.com/gxl2024/claude.git $env:USERPROFILE\claude-ecc
cd $env:USERPROFILE\claude-ecc
.\install.ps1 typescript       # swap for: python golang web swift php
```

Restart Claude Code after installing.

---

## How to Use

### Skill Creator (`/skill-create`)

Run inside any git repository in Claude Code:

```
/skill-create
```

Claude analyzes your last 200 commits and generates a `SKILL.md` capturing your team's conventions — commit format, file structure, testing patterns, and workflows. Claude automatically follows these on subsequent sessions.

**Options:**
```
/skill-create --commits 100       # analyze last 100 commits only
/skill-create --output ./skills   # custom output path
/skill-create --instincts         # also generate continuous-learning instincts
```

---

### MCP Builder (`mcp-configs/`)

Copy a config into your project to give Claude access to external tools:

```bash
# macOS / Linux
cp ~/.claude/mcp-configs/starter.json .mcp.json

# Windows
Copy-Item $env:USERPROFILE\.claude\mcp-configs\starter.json .\.mcp.json
```

Set API keys as needed:

```bash
export GITHUB_TOKEN=ghp_xxx     # enables GitHub MCP server
export BRAVE_API_KEY=BSA_xxx    # enables web search (optional)
```

Restart Claude Code. Claude can now read local files, search GitHub, browse the web, and remember facts across sessions.

| MCP Server | What it enables |
|------------|----------------|
| `filesystem` | Read/write files outside the project |
| `github` | Issues, PRs, code search, repo management |
| `brave-search` | Live web search |
| `memory` | Persistent facts across sessions |
| `fetch` | Fetch any URL as markdown |

---

## Keeping Up to Date

```bash
cd ~/claude-ecc && git pull && ./install.sh
```
