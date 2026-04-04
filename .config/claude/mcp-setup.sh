# MCP servers setup (run once per new machine)
# These are added as user-scope (global) servers

claude mcp add --transport stdio --scope user playwright -- npx @playwright/mcp@latest
claude mcp add --transport stdio --scope user context7 -- npx -y @upstash/context7-mcp
claude mcp add --transport stdio --scope user serena -- uvx --from git+https://github.com/oraios/serena serena start-mcp-server
