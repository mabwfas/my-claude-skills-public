#!/bin/bash
# MCP Server Setup Script — Run on any new PC with Claude Code
# Usage: bash setup-mcp.sh

echo "Setting up global MCP servers..."

# Gemini - Google AI models
claude mcp add gemini -s user -e GEMINI_API_KEY="YOUR_GEMINI_API_KEY_HERE" -- npx -y @rlabs-inc/gemini-mcp@latest

# Stitch - Google UI design
claude mcp add stitch -s user -e STITCH_API_KEY="YOUR_STITCH_API_KEY_HERE" -- npx -y @_davideast/stitch-mcp@latest proxy

# Magic - 21st.dev component library
claude mcp add magic -s user -e API_KEY="YOUR_21ST_DEV_API_KEY_HERE" -- npx -y @21st-dev/magic@latest

# Claude Flow - agent orchestration
claude mcp add claude-flow -s user -- npx -y @claude-flow/cli@latest

# Ruv Swarm - swarm coordination
claude mcp add ruv-swarm -s user -- npx -y ruv-swarm mcp start

# Flow Nexus - platform tools
claude mcp add flow-nexus -s user -- npx -y flow-nexus@latest mcp start

echo ""
echo "All 6 MCP servers configured globally!"
echo "Restart Claude Code to activate."
