# MCP Configurations

Pre-built MCP server configurations for Claude Code.

## Available Configs

| File | Description |
|------|-------------|
| `starter.json` | 5 essential MCP servers: filesystem, GitHub, search, memory, fetch |

## How to Apply

Copy a config into your project or global Claude Code settings:

```bash
# Project-level (only affects this repo)
cp mcp-configs/starter.json .mcp.json

# Global (affects all projects)
node scripts/codex/merge-mcp-config.js mcp-configs/starter.json
```

## Environment Variables

Set these before starting Claude Code:

```bash
export GITHUB_TOKEN=ghp_xxx        # GitHub personal access token
export BRAVE_API_KEY=BSA_xxx       # Brave Search API key (optional)
```

## Adding Custom MCP Servers

Add entries to any config file following the schema:

```json
{
  "mcpServers": {
    "my-server": {
      "command": "node",
      "args": ["path/to/server.js"],
      "env": { "MY_KEY": "${MY_ENV_VAR}" },
      "description": "What this server does"
    }
  }
}
```
