# Project Overview

<!--
  Replace this template with your actual project architecture.
  This file is the single source of truth for how components relate.
-->

## Architecture

| Component | Repo | Spec | Context |
|-----------|------|------|---------|
| _component-1_ | `group/repo-1` | `specs/01-component-1.md` | `context/01-domain.md` |
| _component-2_ | `group/repo-2` | `specs/02-component-2.md` | `context/02-platform.md` |

## Key Constraints

<!-- List the non-negotiable constraints that shape every decision -->

- _Constraint 1_
- _Constraint 2_

## Communication Patterns

<!--
  Describe how components talk to each other.
  Use ASCII diagrams for clarity.
-->

```
component-1 --> component-2 (protocol: description)
component-2 --> component-3 (protocol: description)
```

## Update Rules

- **Specs** are source of truth for component design
- **Context docs** capture operational reality
- **Tech decisions** are append-only (never edit retroactively)
- **README.md** is the external-facing summary
