#!/bin/bash
# Verify all Claude skills are properly installed
# Usage: bash verify.sh [--installed]
#   No flag  = verify source repo (skills/ directory)
#   --installed = verify installed location (~/.claude/skills/my-claude-skills/)

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'; BOLD='\033[1m'
PASS=0; FAIL=0; WARN=0
pass() { echo -e "  ${GREEN}PASS${NC} $1"; ((PASS++)); }
fail() { echo -e "  ${RED}FAIL${NC} $1"; ((FAIL++)); }
warn() { echo -e "  ${YELLOW}WARN${NC} $1"; ((WARN++)); }

if [ "$1" == "--installed" ]; then
    BASE="$HOME/.claude/skills/my-claude-skills"
    echo -e "${BOLD}${CYAN}Verifying INSTALLED skills at: $BASE${NC}"
else
    BASE="$(cd "$(dirname "$0")" && pwd)/skills"
    echo -e "${BOLD}${CYAN}Verifying SOURCE skills at: $BASE${NC}"
fi
echo ""

# CHECK 1: All 14 directories exist
echo -e "${BOLD}[1/5] Directory Structure${NC}"
if [ ! -d "$BASE" ]; then
    fail "Base directory NOT FOUND: $BASE"
    echo -e "\n${RED}Run install.sh first.${NC}"; exit 1
fi
pass "Base directory exists"

for dir in anthropic antigravity composio marketing minimax n8n-mcp ruflo stitch supermemory superpowers ui-ux-pro-max vercel voltagent wordpress; do
    if [ -d "$BASE/$dir" ]; then pass "$dir/"; else fail "$dir/ MISSING"; fi
done

# CHECK 2: SKILL.md file counts
echo ""; echo -e "${BOLD}[2/5] Skill File Counts${NC}"
TOTAL_SKILLS=0
check_count() {
    local dir=$1 min=$2
    if [ -d "$BASE/$dir" ]; then
        local count=$(find "$BASE/$dir" -name "SKILL.md" 2>/dev/null | wc -l)
        TOTAL_SKILLS=$((TOTAL_SKILLS + count))
        if [ "$count" -ge "$min" ]; then pass "$dir: $count skills (need >= $min)"
        elif [ "$count" -gt 0 ]; then warn "$dir: $count skills (need >= $min)"
        else fail "$dir: 0 skills (need >= $min)"; fi
    fi
}
check_count anthropic 17
check_count antigravity 1300
check_count composio 860
check_count marketing 34
check_count minimax 14
check_count ruflo 130
check_count stitch 7
check_count supermemory 2
check_count superpowers 14
check_count ui-ux-pro-max 7
check_count vercel 6
check_count wordpress 14

for dir in n8n-mcp voltagent; do
    if [ -d "$BASE/$dir" ] && find "$BASE/$dir" -name "README.md" 2>/dev/null | grep -q .; then
        pass "$dir: has README (docs-based skill)"
    elif [ -d "$BASE/$dir" ]; then warn "$dir: no README found"; fi
done
echo -e "  ${CYAN}Total SKILL.md files: $TOTAL_SKILLS${NC}"

# CHECK 3: Critical skills spot check
echo ""; echo -e "${BOLD}[3/5] Critical Skill Spot Checks${NC}"
for s in anthropic/pdf/SKILL.md anthropic/docx/SKILL.md anthropic/xlsx/SKILL.md anthropic/pptx/SKILL.md \
         anthropic/frontend-design/SKILL.md superpowers/brainstorming/SKILL.md \
         superpowers/systematic-debugging/SKILL.md superpowers/test-driven-development/SKILL.md \
         superpowers/verification-before-completion/SKILL.md stitch/stitch-design/SKILL.md \
         stitch/react-components/SKILL.md supermemory/skills/super-save/SKILL.md supermemory/skills/super-search/SKILL.md \
         marketing/copywriting/SKILL.md marketing/seo-audit/SKILL.md minimax/frontend-dev/SKILL.md \
         vercel/deploy-to-vercel/SKILL.md wordpress/wp-plugin-development/SKILL.md; do
    if [ -f "$BASE/$s" ]; then pass "$s"; else fail "$s MISSING"; fi
done

# CHECK 4: File integrity
echo ""; echo -e "${BOLD}[4/5] File Integrity${NC}"
EMPTY=0
while IFS= read -r f; do
    [ ! -s "$f" ] && ((EMPTY++))
done < <(find "$BASE" -name "SKILL.md" 2>/dev/null | head -200)
if [ "$EMPTY" -eq 0 ]; then pass "No empty SKILL.md files (checked 200)"; else fail "$EMPTY empty files found"; fi

VALID=0; INVALID=0
while IFS= read -r f; do
    if head -5 "$f" 2>/dev/null | grep -qiE "(description|skill|use when|trigger|---)" 2>/dev/null; then ((VALID++)); else ((INVALID++)); fi
done < <(find "$BASE" -name "SKILL.md" 2>/dev/null | head -50)
if [ "$INVALID" -le 3 ]; then pass "Format check: $VALID/$((VALID+INVALID)) sampled files valid"; else warn "$INVALID/$((VALID+INVALID)) files have non-standard format"; fi

# CHECK 5: Claude Code integration
echo ""; echo -e "${BOLD}[5/5] Claude Code Integration${NC}"
[ -d "$HOME/.claude" ] && pass "~/.claude exists" || warn "~/.claude not found"
if [ -d "$HOME/.claude/skills/my-claude-skills" ]; then
    IC=$(find "$HOME/.claude/skills/my-claude-skills" -name "SKILL.md" 2>/dev/null | wc -l)
    [ "$IC" -gt 2000 ] && pass "Installed globally: $IC skills" || warn "Installed but low count: $IC"
else
    [ "$1" == "--installed" ] && fail "Not installed at ~/.claude/skills/my-claude-skills/" || warn "Not yet installed globally (run: bash install.sh)"
fi

# RESULTS
echo ""
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  ${GREEN}PASSED:${NC}  $PASS | ${YELLOW}WARNINGS:${NC} $WARN | ${RED}FAILED:${NC}  $FAIL"
echo -e "  ${CYAN}Total skills: $TOTAL_SKILLS${NC}"
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
if [ "$FAIL" -eq 0 ]; then
    echo -e "${GREEN}${BOLD}ALL CHECKS PASSED${NC}"; exit 0
else
    echo -e "${RED}${BOLD}$FAIL CHECKS FAILED${NC}"; exit 1
fi
