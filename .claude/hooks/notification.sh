#!/usr/bin/env bash
# Runs on Claude Code notifications
# Reads notification event JSON from stdin

set -euo pipefail

EVENT=$(cat)

# Extract notification message
MESSAGE=$(echo "$EVENT" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('message', d.get('title', 'Claude Code notification')))
" 2>/dev/null || echo "Claude Code notification")

# Send desktop notification if available
if command -v notify-send &>/dev/null; then
  notify-send "Claude Code" "$MESSAGE" --icon=terminal 2>/dev/null || true
elif command -v osascript &>/dev/null; then
  osascript -e "display notification \"$MESSAGE\" with title \"Claude Code\"" 2>/dev/null || true
fi

# Log to file
LOG_DIR="${HOME}/.claude/logs"
mkdir -p "$LOG_DIR"
echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) [NOTIFICATION] $MESSAGE" >> "$LOG_DIR/claude-code.log"

exit 0
