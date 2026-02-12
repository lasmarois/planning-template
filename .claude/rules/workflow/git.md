# Git Workflow

## Branching Strategy

```
dev branch (development) --> main branch (production)
```

## Daily Workflow

1. Work on `dev` branch (or feature branches that merge into `dev`)
2. Push to `dev` — CI deploys to dev environment
3. Test on dev — verify in dev environment
4. When satisfied — merge `dev` into `main`
5. Push `main` — CI deploys to production

## When to Commit

- After completing a goal phase or milestone
- After significant planning/documentation cleanup
- Before starting a new feature (clean working state)
- When user explicitly requests

## When NOT to Commit

- Mid-implementation (incomplete code)
- Work-in-progress planning files
- Uncommitted changes from previous sessions without user approval

## Commit Message Format

```
<type>: <short description>

<body - what changed and why>

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Types:** `feat:`, `fix:`, `refactor:`, `docs:`, `chore:`, `test:`

## Safety Rules

- NEVER use `--force` on `main` without explicit user approval
- NEVER commit secrets (see `security.md`)
- NEVER amend commits without explicit user request
- Check `git status` before and after commits
