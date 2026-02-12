# Goal-Based Workflow

## Session Start Checklist

1. Read `@.planning/GOALS.md` to identify active goal
2. If goal exists, read: `task_plan.md`, `findings.md`, `progress.md`
3. Check `MILESTONES.md` for roadmap context
4. Resume work from last session

## Two-Tier Goal System

- **Milestones** (MILESTONES.md) = What we're building (features, roadmap)
- **Goals** (GOALS.md) = How we're building it (actionable work units)

## Planning Files Location

```
project root/                   (ACTIVE goal's files)
├── task_plan.md
├── findings.md
├── progress.md

└── .planning/
    ├── GOALS.md               # Goal registry
    ├── MILESTONES.md          # Project roadmap
    ├── TECH_DECISIONS.md      # Technical decisions
    ├── history/goal-N/        # Completed goals
    └── iced/goal-N/           # Paused goals
```

## Starting a New Goal

1. Update `.planning/GOALS.md` — add to registry, set as "Active Goal"
2. Invoke `/planning-with-files "Goal #N: Description"`
3. Creates `task_plan.md`, `findings.md`, `progress.md` in project root

## Icing a Goal (pause)

```bash
mkdir -p .planning/iced/goal-N-description
mv task_plan.md findings.md progress.md .planning/iced/goal-N-description/
# Update GOALS.md status to "Iced"
```

## Completing a Goal

```bash
mkdir -p .planning/history/goal-N-description
mv task_plan.md findings.md progress.md .planning/history/goal-N-description/
# Update GOALS.md status to "Complete"
git add .planning/
git commit -m "docs: complete Goal #N - Description"
```

## Resuming an Iced Goal

```bash
mv .planning/iced/goal-N-description/{task_plan,findings,progress}.md .
# Update GOALS.md status to "In Progress"
```
