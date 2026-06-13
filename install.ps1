# Install ECC (Everything Claude Code) — agents, skills, commands, hooks, rules
# Usage (PowerShell):
#   .\install.ps1                  # Install all components
#   .\install.ps1 typescript       # Install + TypeScript rules
#   .\install.ps1 python           # Install + Python rules
#   .\install.ps1 typescript python  # Install + multiple rulesets

param(
    [Parameter(ValueFromRemainingArguments)]
    [string[]]$Languages
)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"

Write-Host ""
Write-Host "  Installing ECC to $ClaudeDir"
Write-Host ""

# ------------------------------------------------------------------
# 1. Core directories
# ------------------------------------------------------------------
$dirs = @("agents","commands","hooks","skills","rules","mcp-configs","scripts")
foreach ($d in $dirs) {
    New-Item -ItemType Directory -Force -Path (Join-Path $ClaudeDir $d) | Out-Null
}

# ------------------------------------------------------------------
# Helper: copy directory contents
# ------------------------------------------------------------------
function Copy-Dir($src, $dst) {
    if (Test-Path $src) {
        New-Item -ItemType Directory -Force -Path $dst | Out-Null
        Copy-Item -Path "$src\*" -Destination $dst -Recurse -Force
        return $true
    }
    return $false
}

# ------------------------------------------------------------------
# 2. Agents
# ------------------------------------------------------------------
$src = Join-Path $ScriptDir ".claude\agents"
if (Copy-Dir $src (Join-Path $ClaudeDir "agents")) {
    Write-Host "  [OK] agents"
}

# ------------------------------------------------------------------
# 3. Commands (includes /skill-create)
# ------------------------------------------------------------------
$src = Join-Path $ScriptDir ".claude\commands"
if (Copy-Dir $src (Join-Path $ClaudeDir "commands")) {
    Write-Host "  [OK] commands (includes /skill-create, /plan, /code-review, etc.)"
}

# ------------------------------------------------------------------
# 4. Skills (includes mcp-server-patterns)
# ------------------------------------------------------------------
$src = Join-Path $ScriptDir ".claude\skills"
if (Copy-Dir $src (Join-Path $ClaudeDir "skills")) {
    Write-Host "  [OK] skills (includes mcp-server-patterns, tdd-workflow, etc.)"
}

# ------------------------------------------------------------------
# 5. Common rules
# ------------------------------------------------------------------
$src = Join-Path $ScriptDir "rules\common"
$dst = Join-Path $ClaudeDir "rules\common"
if (Copy-Dir $src $dst) {
    Write-Host "  [OK] rules\common"
}

# ------------------------------------------------------------------
# 6. Language-specific rules (optional args)
# ------------------------------------------------------------------
foreach ($lang in $Languages) {
    $src = Join-Path $ScriptDir "rules\$lang"
    $dst = Join-Path $ClaudeDir "rules\$lang"
    if (Test-Path $src) {
        Copy-Dir $src $dst | Out-Null
        Write-Host "  [OK] rules\$lang"
    } else {
        Write-Host "  [SKIP] rules\$lang — not found (available: typescript python golang web swift php)"
    }
}

# ------------------------------------------------------------------
# 7. MCP configs
# ------------------------------------------------------------------
$src = Join-Path $ScriptDir "mcp-configs"
if (Copy-Dir $src (Join-Path $ClaudeDir "mcp-configs")) {
    Write-Host "  [OK] mcp-configs"
}

# ------------------------------------------------------------------
# 8. Scripts (needed by hooks)
# ------------------------------------------------------------------
$src = Join-Path $ScriptDir "scripts"
if (Copy-Dir $src (Join-Path $ClaudeDir "scripts")) {
    Write-Host "  [OK] scripts"
}

Write-Host ""
Write-Host "  Done! ECC installed to $ClaudeDir"
Write-Host ""
Write-Host "  Next steps:"
Write-Host "  1. Restart Claude Code"
Write-Host "  2. Try /skill-create in any repo to generate skills from your git history"
Write-Host "  3. Try /plan to create an implementation plan"
Write-Host "  4. To enable MCP servers, copy a config to your project:"
Write-Host "     Copy-Item `$env:USERPROFILE\.claude\mcp-configs\starter.json .\.mcp.json"
Write-Host ""
