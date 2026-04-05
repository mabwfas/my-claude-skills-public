# My Claude Skills

**2,590+ agentic skills** consolidated from 16 top skill repositories into one install.

## Quick Install

```bash
git clone https://github.com/mabwfas/my-claude-skills-public.git ~/.claude/skills/my-claude-skills
```

Or install globally with **automatic double verification**:

```bash
git clone https://github.com/mabwfas/my-claude-skills-public.git
cd my-claude-skills-public
bash install.sh
```

The installer runs verification **twice** to ensure all 2,590+ skills are properly installed.

## Verify Installation

Run anytime to check everything works:

```bash
bash verify.sh              # verify source repo
bash verify.sh --installed   # verify installed skills
```

**5-point verification checks:**
1. All 16 skill directories exist
2. SKILL.md file counts match expected minimums
3. 18 critical skills are present (PDF, DOCX, TDD, debugging, etc.)
4. No empty or corrupted skill files
5. Claude Code integration is configured

## MCP Server Setup

```bash
bash setup-mcp.sh
```

Sets up 6 MCP servers: Gemini, Stitch, Magic (21st.dev), Claude Flow, Ruv Swarm, Flow Nexus.

## What's Included

| Source | Skills | Focus |
|--------|--------|-------|
| Anthropic Official | 17 | PDF, DOCX, XLSX, PPTX generation |
| Antigravity | 1,340 | Mega-collection across all domains |
| Composio | 864 | External API & service integrations |
| Marketing Skills | 34 | Copywriting, SEO, ads, CRO |
| MiniMax | 14 | AI media generation (speech, video, music) |
| Ruflo | 130 | Advanced agent workflows & benchmarks |
| Superpowers | 14 | TDD, debugging, planning, brainstorming |
| UI/UX Pro Max | 7 | 67 UI styles, 96 palettes, 57 font pairings |
| Stitch (Google) | 7 | AI-powered UI design & prototyping |
| Vercel | 6 | Deployment, Next.js, React patterns |
| WordPress | 14 | CMS development |
| Supermemory | 2 | Persistent context across sessions |
| n8n MCP | - | Workflow automation & triggers |
| VoltAgent | - | Autonomous multi-step agent tasks |
| Awesome DESIGN.md | 55 | Brand design systems (Airbnb, Apple, Stripe, etc.) |
| Claw Code | - | Open-source Rust CLI/runtime for coding agents |

## Skill Routing

| Task | Use These Skills |
|------|-----------------|
| UI, design, frontend | `ui-ux-pro-max` + `stitch` |
| Writing, copy, marketing | `marketing` |
| File output (PDF/Word/Excel/Slides) | `anthropic` |
| Automation, workflows | `n8n-mcp` |
| External API integration | `composio` |
| Memory across sessions | `supermemory` |
| Debugging, TDD, planning | `superpowers` |
| AI media generation | `minimax` |
| Deployment, Next.js | `vercel` |
| WordPress, CMS | `wordpress` |
| Brand-style UI design | `awesome-design-md` |
| Rust CLI agent runtime | `claw-code` |
| Everything else | Check `antigravity` first |

## Sources

All skills sourced from their open-source repositories under original licenses:

- [anthropics/skills](https://github.com/anthropics/skills)
- [sickn33/antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills)
- [ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills)
- [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills)
- [MiniMax-AI/skills](https://github.com/MiniMax-AI/skills)
- [ruvnet/ruflo](https://github.com/ruvnet/ruflo)
- [obra/superpowers](https://github.com/obra/superpowers)
- [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
- [google-labs-code/stitch-skills](https://github.com/google-labs-code/stitch-skills)
- [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills)
- [WordPress/agent-skills](https://github.com/WordPress/agent-skills)
- [supermemoryai/claude-supermemory](https://github.com/supermemoryai/claude-supermemory)
- [czlonkowski/n8n-mcp](https://github.com/czlonkowski/n8n-mcp)
- [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills)
- [VoltAgent/awesome-design-md](https://github.com/VoltAgent/awesome-design-md)
- [ultraworkers/claw-code](https://github.com/ultraworkers/claw-code)
