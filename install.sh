#!/bin/bash
# Install all skills globally for Claude Code
# Runs verification TWICE after install to ensure everything works.

DEST="$HOME/.claude/skills/my-claude-skills"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; NC='\033[0m'; BOLD='\033[1m'

echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BOLD}${CYAN}  Installing 2,449+ Claude Skills${NC}"
echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

echo -e "${BOLD}[1/4] Creating destination...${NC}"
mkdir -p "$DEST"
echo -e "  ${GREEN}OK${NC} $DEST"

echo ""; echo -e "${BOLD}[2/4] Copying skills...${NC}"
cp -r "$SCRIPT_DIR/skills/"* "$DEST/"
TOTAL=$(find "$DEST" -name "SKILL.md" 2>/dev/null | wc -l)
echo -e "  ${GREEN}OK${NC} Copied $TOTAL SKILL.md files"
echo ""
echo "  Included: Anthropic(17) Antigravity(1340) Composio(864) Marketing(34)"
echo "  MiniMax(14) Ruflo(130) Superpowers(14) UI/UX(7) Stitch(7) Vercel(6)"
echo "  WordPress(14) Supermemory(2) n8n-MCP VoltAgent"

echo ""; echo -e "${BOLD}[3/4] Verification pass 1 of 2...${NC}"; echo ""
bash "$SCRIPT_DIR/verify.sh" --installed && V1="PASS" || V1="FAIL"

echo ""; echo -e "${BOLD}[4/4] Verification pass 2 of 2...${NC}"; echo ""
sleep 1
bash "$SCRIPT_DIR/verify.sh" --installed && V2="PASS" || V2="FAIL"

echo ""
echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  Location:      $DEST"
echo -e "  Total skills:  $TOTAL"
echo -e "  Verify pass 1: $V1"
echo -e "  Verify pass 2: $V2"
echo -e "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

if [ "$V1" == "PASS" ] && [ "$V2" == "PASS" ]; then
    echo -e "${GREEN}${BOLD}  COMPLETE — All skills verified twice.${NC}"
    echo ""; echo "  Next: Open any project in Claude Code. Skills are ready."
    echo "  Optional: bash setup-mcp.sh (for MCP server integrations)"
else
    echo -e "${RED}${BOLD}  ISSUES DETECTED — Check output above.${NC}"
    echo "  Try: bash install.sh (re-run) or bash verify.sh --installed"
    exit 1
fi
