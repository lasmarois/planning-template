# Claude Code — Session Start

## First Steps (every session)

1. Read `@.planning/GOALS.md` to identify the **active goal**
2. If a goal is active, read its planning files: `task_plan.md`, `findings.md`, `progress.md`
3. Check `@.planning/MILESTONES.md` for roadmap context
4. Resume work from last checkpoint

## Planning Workflow

- Use `/planning-with-files` skill for any non-trivial task (>5 tool calls)
- Always read planning files before making changes
- Update `progress.md` after completing each phase
- Record discoveries in `findings.md`

## Context Integrity

- Update context docs when discovering operational facts
- Reference context docs — don't duplicate information
- Specs are source of truth for component design
- Context docs capture operational reality
- Tech decisions are append-only (never edit existing entries retroactively)

## Context Map — Where to Read What

| Topic | Location |
|-------|----------|
| Project architecture overview | `@.claude/rules/project-overview.md` |
| Project milestones & roadmap | `@.planning/MILESTONES.md` |
| Technical decisions log | `@.planning/TECH_DECISIONS.md` |
| Active goal & goal registry | `@.planning/GOALS.md` |
| Implementation specs | `specs/` |
| Context documents | `context/` |
| Operational runbooks | `runbooks/` |
