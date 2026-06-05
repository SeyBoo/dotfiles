# MCP servers setup (run once per new machine)
# These are added as user-scope (global) servers

claude mcp add --transport stdio --scope user playwright -- npx @playwright/mcp@latest
claude mcp add --transport stdio --scope user context7 -- npx -y @upstash/context7-mcp
claude mcp add --transport http --scope user betterstack https://mcp.betterstack.com
curl -fsSL https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.sh | bash
