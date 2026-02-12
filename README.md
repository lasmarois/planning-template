# Planning Template

Reusable project template for Claude Code goal-based planning workflow.

## Prerequisites

This template depends on the [planning-with-files](https://github.com/OthmanAdi/planning-with-files) skill for Claude Code. Install it before using this template.

### Install planning-with-files

```bash
# Recommended — Claude Code plugin
/plugin marketplace add OthmanAdi/planning-with-files
/plugin install planning-with-files@planning-with-files
```

Verify it's working by starting a Claude Code session — you should see the skill loaded, or type `/planning-with-files` to invoke it manually.

> See the [planning-with-files docs](https://github.com/OthmanAdi/planning-with-files/blob/master/docs/installation.md) for alternative installation methods.

## Quick Start

1. Click **"Use this template"** on GitHub (or copy the directory manually)
2. Clone your new repo and `cd` into it
3. Install the planning-with-files skill (see above)
4. Customize `.claude/rules/project-overview.md` with your architecture
5. Customize `.claude/rules/workflow/local-dev.md` with your dev setup
6. Add external repos to `.claude/settings.json` → `additionalDirectories`
7. Define milestones in `.planning/MILESTONES.md`
8. Start your first goal: update `.planning/GOALS.md` and invoke `/planning-with-files`

## Directory Structure

```
.
├── .claude/                          # Claude Code configuration
│   ├── CLAUDE.md                     # Session start instructions
│   ├── settings.json                 # Global settings (additional dirs, permissions)
│   ├── settings.local.json           # Local overrides (gitignored)
│   └── rules/                        # Persistent rules loaded every session
│       ├── project-overview.md       # Architecture overview (customize this)
│       ├── security.md               # Security rules
│       └── workflow/                 # Workflow rules
│           ├── goal-workflow.md      # Goal lifecycle (start, ice, complete)
│           ├── documentation.md      # What to update and when
│           ├── git.md               # Branching, commits, safety
│           ├── changelog.md         # CHANGELOG convention
│           └── local-dev.md         # Dev setup (customize this)
│
├── .planning/                        # Planning & tracking
│   ├── GOALS.md                     # Goal registry (active, iced, complete)
│   ├── MILESTONES.md                # Project roadmap
│   ├── TECH_DECISIONS.md            # Append-only technical decisions log
│   ├── history/                     # Completed goal archives
│   └── iced/                        # Paused goal archives
│
├── specs/                            # Implementation specifications
├── context/                          # Domain/system context documents
├── runbooks/                         # Operational procedures
├── templates/                        # Document templates
│   ├── spec-template.md
│   ├── context-template.md
│   ├── tech-decision-template.md
│   └── runbook-template.md
│
├── task_plan.md                      # (Created by /planning-with-files for active goal)
├── findings.md                       # (Created by /planning-with-files for active goal)
├── progress.md                       # (Created by /planning-with-files for active goal)
│
├── .gitignore
└── README.md
```

## Workflow Overview

### Two-Tier System

- **Milestones** = What we're building (features, roadmap phases)
- **Goals** = How we're building it (actionable work units within milestones)

### Goal Lifecycle

```
Start Goal                          Complete Goal
    │                                   │
    ▼                                   ▼
Update GOALS.md ──► /planning-with-files ──► Work phases ──► Archive to history/
    │                   │
    │                   ▼
    │            task_plan.md    (phases & tasks)
    │            findings.md     (research & discoveries)
    │            progress.md     (session log)
    │
    ▼ (pause)
Move files to .planning/iced/goal-N/
```

### Session Flow

1. Claude reads `GOALS.md` → finds active goal
2. Reads `task_plan.md`, `findings.md`, `progress.md` → resumes context
3. Works through phases → updates progress
4. On completion → archives to `history/`, updates `GOALS.md`

### Technical Decisions

Append-only log in `.planning/TECH_DECISIONS.md`. Never edit past entries — if a decision is superseded, add a new `TD-XXX` referencing the old one.

## Customization Checklist

- [ ] `.claude/rules/project-overview.md` — your architecture
- [ ] `.claude/rules/workflow/local-dev.md` — your dev environment
- [ ] `.claude/settings.json` — additional repo directories
- [ ] `.planning/MILESTONES.md` — your project roadmap
- [ ] `.planning/GOALS.md` — your first goal
- [ ] `context/` — your domain context documents
- [ ] `specs/` — your implementation specifications
