#!/bin/bash
# Hook: SessionStart
# Loads active goal context and injects it so Claude resumes where it left off.

set -euo pipefail

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"
GOALS_FILE="$PROJECT_DIR/.planning/GOALS.md"
TASK_PLAN="$PROJECT_DIR/task_plan.md"
PROGRESS="$PROJECT_DIR/progress.md"
FINDINGS="$PROJECT_DIR/findings.md"
HANDOFF="$PROJECT_DIR/HANDOFF.md"

context=""

# Load handoff if it exists (left by PreCompact hook)
if [ -f "$HANDOFF" ]; then
  handoff_content=$(cat "$HANDOFF")
  context="$context

## Session Handoff (from previous compaction)
$handoff_content"
fi

# Load active goal from GOALS.md
if [ -f "$GOALS_FILE" ]; then
  goals_content=$(cat "$GOALS_FILE")
  context="$context

## Active Goals
$goals_content"
fi

# Load planning files if they exist (active goal in progress)
if [ -f "$TASK_PLAN" ]; then
  plan_content=$(cat "$TASK_PLAN")
  context="$context

## Current Task Plan
$plan_content"
fi

if [ -f "$PROGRESS" ]; then
  # Last 50 lines of progress to avoid flooding context
  progress_content=$(tail -50 "$PROGRESS")
  context="$context

## Recent Progress (last 50 lines)
$progress_content"
fi

if [ -f "$FINDINGS" ]; then
  findings_content=$(cat "$FINDINGS")
  context="$context

## Findings
$findings_content"
fi

if [ -z "$context" ]; then
  exit 0
fi

# Output as JSON with additionalContext
jq -n --arg ctx "$context" '{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": $ctx
  }
}'
