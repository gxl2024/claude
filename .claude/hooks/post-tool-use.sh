#!/usr/bin/env bash
# Runs after Edit/Write/Bash tool calls
# Reads hook event JSON from stdin

set -euo pipefail

# Read the event from stdin
EVENT=$(cat)

# Extract tool name
TOOL=$(echo "$EVENT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_name',''))" 2>/dev/null || true)

# For file edits, optionally run a linter/formatter if one is detected
if [[ "$TOOL" == "Edit" || "$TOOL" == "Write" ]]; then
  FILE=$(echo "$EVENT" | python3 -c "import sys,json; d=json.load(sys.stdin); params=d.get('tool_input',{}); print(params.get('file_path',''))" 2>/dev/null || true)

  if [[ -n "$FILE" ]]; then
    EXT="${FILE##*.}"

    # Auto-format TypeScript/JavaScript if prettier is available
    if [[ "$EXT" =~ ^(ts|tsx|js|jsx|json|css|md)$ ]] && command -v npx &>/dev/null; then
      if [[ -f "$(git rev-parse --show-toplevel 2>/dev/null)/.prettierrc" ]] || \
         [[ -f "$(git rev-parse --show-toplevel 2>/dev/null)/prettier.config.js" ]]; then
        npx prettier --write "$FILE" 2>/dev/null || true
      fi
    fi

    # Auto-format Python if ruff is available
    if [[ "$EXT" == "py" ]] && command -v ruff &>/dev/null; then
      ruff format "$FILE" 2>/dev/null || true
    fi
  fi
fi

exit 0
