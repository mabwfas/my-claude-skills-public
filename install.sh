#!/bin/bash
# Install all skills globally for Claude Code
# Usage: bash install.sh
#
# This copies all skills to ~/.claude/skills/ so they're available in every project.

DEST="$HOME/.claude/skills/my-claude-skills"

echo "Installing 2,449+ skills to $DEST ..."

mkdir -p "$DEST"
cp -r skills/* "$DEST/"

echo ""
echo "Done! Skills installed to $DEST"
echo ""
echo "Skills included:"
echo "  - Anthropic Official (17 skills) — PDF, DOCX, XLSX, PPTX generation"
echo "  - Antigravity (1,340 skills) — Mega-collection across all domains"
echo "  - Composio (864 skills) — External API & service integrations"
echo "  - Marketing (34 skills) — Copywriting, SEO, ads, CRO"
echo "  - MiniMax (14 skills) — AI-powered media generation"
echo "  - Ruflo (130 skills) — Advanced agent workflows"
echo "  - Superpowers (14 skills) — TDD, debugging, planning"
echo "  - UI/UX Pro Max (7 skills) — 67 UI styles, 96 palettes"
echo "  - Stitch (7 skills) — Google AI UI design"
echo "  - Vercel (6 skills) — Deployment, Next.js, React"
echo "  - WordPress (14 skills) — CMS development"
echo "  - Supermemory (2 skills) — Persistent context"
echo "  - n8n MCP — Workflow automation"
echo "  - VoltAgent — Autonomous agent tasks"
echo ""
echo "To also set up MCP servers, run: bash setup-mcp.sh"
