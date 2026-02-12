# Documentation Guidelines

## What to Update and When

| Change Type | Update |
|-------------|--------|
| Architecture change | `@.planning/TECH_DECISIONS.md` |
| New milestone | `@.planning/MILESTONES.md` (add with status) |
| New goal | `@.planning/GOALS.md` (add to registry) |
| Goal complete | Archive to `.planning/history/`, update `@.planning/GOALS.md` |
| Milestone complete | Update `@.planning/MILESTONES.md` status |
| Operational discovery | Relevant `context/` document |
| Design decision | `@.planning/TECH_DECISIONS.md` as new TD-XXX |
| Implementation details | Relevant `specs/` document |

## Tech Decision Format

```markdown
## TD-XXX: Decision Name (YYYY-MM-DD)

**Status:** Accepted | Proposed | Superseded by TD-YYY

**Context:** Why this decision was needed.

**Decision:** What was decided.

**Alternatives Considered:**
- Alternative A — why rejected
- Alternative B — why rejected

**Consequences:**
- Positive: ...
- Negative: ...
```

## Spec Document Format

```markdown
# Spec NN: Component/Feature Name

## Overview
One-paragraph summary of what this spec covers.

## Design
Detailed design decisions, data models, API contracts.

## Implementation Notes
Specific guidance for implementation.

## Security Considerations
Security implications and mitigations.

## Testing
How to validate the implementation.
```

## Context Document Format

```markdown
# Context: Domain/System Name

## Overview
What this system/domain is and why it matters.

## Current State
How things work today.

## Key Details
Important facts, configurations, constraints.

## Gaps / Problems
What's missing or broken.
```
