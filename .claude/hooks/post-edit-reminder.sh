#!/bin/bash
# Hook: PostToolUse (Write|Edit)
# Lightweight reminder to update progress.md when files change during an active goal.

set -euo pipefail

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"
INPUT=$(cat)

# Only remind if there's an active goal
if [ ! -f "$PROJECT_DIR/task_plan.md" ]; then
  exit 0
fi

# Extract the file that was modified
file_path=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Skip if the edited file IS a planning file (avoid recursive reminders)
case "$file_path" in
  */task_plan.md|*/progress.md|*/findings.md|*/HANDOFF.md|*/GOALS.md|*/MILESTONES.md|*/BRANCHES.md|*/TECH_DECISIONS.md)
    exit 0
    ;;
esac

# Output reminder as additionalContext
jq -n '{
  "hookSpecificOutput": {
    "hookEventName": "PostToolUse",
    "additionalContext": "Reminder: an active goal is in progress. Update progress.md if this change is significant."
  }
}'
