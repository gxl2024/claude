#!/usr/bin/env bash
# Runs when a subagent stops
# Reads subagent stop event JSON from stdin

set -euo pipefail

EVENT=$(cat)

# Extract subagent info
AGENT=$(echo "$EVENT" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('agent_name', d.get('subagent_type', 'unknown')))
" 2>/dev/null || echo "unknown")

# Log subagent completion
LOG_DIR="${HOME}/.claude/logs"
mkdir -p "$LOG_DIR"
echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) [SUBAGENT_STOP] Agent '$AGENT' completed" >> "$LOG_DIR/claude-code.log"

exit 0
