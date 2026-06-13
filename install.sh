#!/usr/bin/env bash
# Install ECC (Everything Claude Code) — agents, skills, commands, hooks, rules
# Usage:
#   ./install.sh                  # Install all components
#   ./install.sh typescript       # Install + TypeScript rules
#   ./install.sh python           # Install + Python rules
#   ./install.sh typescript python  # Install + multiple rulesets

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"

echo ""
echo "  Installing ECC to ${CLAUDE_DIR}"
echo ""

# ------------------------------------------------------------------
# 1. Core directories
# ------------------------------------------------------------------
mkdir -p "${CLAUDE_DIR}/agents"
mkdir -p "${CLAUDE_DIR}/commands"
mkdir -p "${CLAUDE_DIR}/hooks"
mkdir -p "${CLAUDE_DIR}/skills"
mkdir -p "${CLAUDE_DIR}/rules"

# ------------------------------------------------------------------
# 2. Copy agents (subagents for delegation)
# ------------------------------------------------------------------
if [ -d "${SCRIPT_DIR}/.claude/agents" ]; then
  cp -r "${SCRIPT_DIR}/.claude/agents/." "${CLAUDE_DIR}/agents/"
  echo "  [OK] agents"
fi

# ------------------------------------------------------------------
# 3. Copy commands (slash commands)
# ------------------------------------------------------------------
if [ -d "${SCRIPT_DIR}/.claude/commands" ]; then
  cp -r "${SCRIPT_DIR}/.claude/commands/." "${CLAUDE_DIR}/commands/"
  echo "  [OK] commands (includes /skill-create, /plan, /code-review, etc.)"
fi

# ------------------------------------------------------------------
# 4. Copy skills
# ------------------------------------------------------------------
if [ -d "${SCRIPT_DIR}/.claude/skills" ]; then
  cp -r "${SCRIPT_DIR}/.claude/skills/." "${CLAUDE_DIR}/skills/"
  echo "  [OK] skills (includes mcp-server-patterns, tdd-workflow, etc.)"
fi

# ------------------------------------------------------------------
# 5. Copy common rules (always)
# ------------------------------------------------------------------
if [ -d "${SCRIPT_DIR}/rules/common" ]; then
  mkdir -p "${CLAUDE_DIR}/rules/common"
  cp -r "${SCRIPT_DIR}/rules/common/." "${CLAUDE_DIR}/rules/common/"
  echo "  [OK] rules/common"
fi

# ------------------------------------------------------------------
# 6. Language-specific rules (optional args)
# ------------------------------------------------------------------
for lang in "$@"; do
  if [ -d "${SCRIPT_DIR}/rules/${lang}" ]; then
    mkdir -p "${CLAUDE_DIR}/rules/${lang}"
    cp -r "${SCRIPT_DIR}/rules/${lang}/." "${CLAUDE_DIR}/rules/${lang}/"
    echo "  [OK] rules/${lang}"
  else
    echo "  [SKIP] rules/${lang} — not found (available: typescript python golang web swift php)"
  fi
done

# ------------------------------------------------------------------
# 7. MCP configs
# ------------------------------------------------------------------
if [ -d "${SCRIPT_DIR}/mcp-configs" ]; then
  mkdir -p "${CLAUDE_DIR}/mcp-configs"
  cp -r "${SCRIPT_DIR}/mcp-configs/." "${CLAUDE_DIR}/mcp-configs/"
  echo "  [OK] mcp-configs"
fi

# ------------------------------------------------------------------
# 8. Scripts (needed by hooks)
# ------------------------------------------------------------------
if [ -d "${SCRIPT_DIR}/scripts" ]; then
  cp -r "${SCRIPT_DIR}/scripts/." "${CLAUDE_DIR}/scripts/"
  echo "  [OK] scripts"
fi

echo ""
echo "  Done! ECC installed to ${CLAUDE_DIR}"
echo ""
echo "  Next steps:"
echo "  1. Restart Claude Code"
echo "  2. Try /skill-create in any repo to generate skills from your git history"
echo "  3. Try /plan to create an implementation plan"
echo "  4. To enable MCP servers, copy an mcp-configs/ file to your project:"
echo "     cp ~/.claude/mcp-configs/starter.json /path/to/your/project/.mcp.json"
echo ""
