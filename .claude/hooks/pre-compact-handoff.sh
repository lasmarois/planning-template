#!/bin/bash
# Hook: PreCompact
# Saves a HANDOFF.md snapshot before context compaction so the next
# context window can resume cleanly.

set -euo pipefail

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"
TASK_PLAN="$PROJECT_DIR/task_plan.md"
PROGRESS="$PROJECT_DIR/progress.md"
HANDOFF="$PROJECT_DIR/HANDOFF.md"

# Only write handoff if there's an active goal (task_plan.md exists)
if [ ! -f "$TASK_PLAN" ]; then
  exit 0
fi

# Extract current phase from task_plan.md (look for in-progress or next pending phase)
current_phase=""
if [ -f "$TASK_PLAN" ]; then
  current_phase=$(grep -E "^\s*-\s*\[.\]|^##" "$TASK_PLAN" | head -20 || true)
fi

# Extract last progress entries
last_progress=""
if [ -f "$PROGRESS" ]; then
  last_progress=$(tail -30 "$PROGRESS")
fi

# Write HANDOFF.md
cat > "$HANDOFF" << EOF
# Session Handoff

Generated at: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
Reason: context compaction

## Where I Was

$current_phase

## Recent Progress

$last_progress

## Next Steps

Re-read task_plan.md for full phase details. Continue from the current phase.
EOF

exit 0
