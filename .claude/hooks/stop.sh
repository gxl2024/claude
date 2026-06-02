#!/usr/bin/env bash
# Runs when Claude Code stops (completes a response)
# Reads stop event JSON from stdin

set -euo pipefail

EVENT=$(cat)

# Log session stop
LOG_DIR="${HOME}/.claude/logs"
mkdir -p "$LOG_DIR"
echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) [STOP] Claude Code response completed" >> "$LOG_DIR/claude-code.log"

# Optional: play a sound on macOS
if command -v afplay &>/dev/null; then
  afplay /System/Library/Sounds/Tink.aiff 2>/dev/null || true
fi

exit 0
