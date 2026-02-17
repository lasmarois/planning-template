#!/bin/bash
# Hook: Stop (command type)
# Checks if progress.md was updated during this session when an active goal exists.
# Uses file modification time — if progress.md is older than 10 minutes, blocks stop.

set -euo pipefail

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"
TASK_PLAN="$PROJECT_DIR/task_plan.md"
PROGRESS="$PROJECT_DIR/progress.md"

# No active goal — allow stop
if [ ! -f "$TASK_PLAN" ]; then
  exit 0
fi

# No progress file at all — block stop
if [ ! -f "$PROGRESS" ]; then
  echo "progress.md does not exist but task_plan.md is present. Create progress.md before stopping." >&2
  exit 2
fi

# Check if progress.md was modified in the last 10 minutes
if [ "$(uname)" = "Darwin" ]; then
  mod_time=$(stat -f %m "$PROGRESS")
else
  mod_time=$(stat -c %Y "$PROGRESS")
fi

now=$(date +%s)
age=$(( now - mod_time ))

if [ "$age" -gt 600 ]; then
  echo "progress.md was last updated $(( age / 60 )) minutes ago. Update it with what was done this session before stopping." >&2
  exit 2
fi

exit 0
