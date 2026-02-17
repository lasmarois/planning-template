#!/bin/bash
# Hook: PreToolUse (Bash)
# Validates git commit messages match the <type>: <subject> format.
# Blocks non-conforming commits.

set -euo pipefail

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Only check git commit commands
if ! echo "$COMMAND" | grep -qE '^\s*git\s+commit'; then
  exit 0
fi

# Extract the commit message from -m flag
# Handles: git commit -m "message", git commit -m 'message', heredoc patterns
commit_msg=""

# Try to extract from -m "..." or -m '...'
if echo "$COMMAND" | grep -qE '\-m\s'; then
  commit_msg=$(echo "$COMMAND" | sed -nE 's/.*-m\s+["'"'"']([^"'"'"']*).*/\1/p' | head -1)
fi

# If using heredoc pattern (cat <<), let it through (too complex to parse)
if echo "$COMMAND" | grep -q 'cat <<'; then
  exit 0
fi

# If we couldn't extract a message, let it through (might be --amend or interactive)
if [ -z "$commit_msg" ]; then
  exit 0
fi

# Extract first line (subject)
subject=$(echo "$commit_msg" | head -1)

# Validate format: <type>: <subject>
valid_types="feat|fix|refactor|docs|test|chore|perf|ci"
if ! echo "$subject" | grep -qE "^($valid_types): .+"; then
  jq -n --arg reason "Commit message does not match format: <type>: <subject>. Valid types: $valid_types. Got: '$subject'" '{
    "hookSpecificOutput": {
      "hookEventName": "PreToolUse",
      "permissionDecision": "deny",
      "permissionDecisionReason": $reason
    }
  }'
  exit 0
fi

# Validate subject length (max 72 chars)
if [ ${#subject} -gt 72 ]; then
  jq -n --arg reason "Commit subject exceeds 72 characters (${#subject}). Shorten it." '{
    "hookSpecificOutput": {
      "hookEventName": "PreToolUse",
      "permissionDecision": "deny",
      "permissionDecisionReason": $reason
    }
  }'
  exit 0
fi

# Check for secrets patterns
if echo "$COMMAND" | grep -qiE '(password|secret|api_key|token)\s*=\s*['"'"'"][^'"'"'"]+['"'"'"]'; then
  jq -n '{
    "hookSpecificOutput": {
      "hookEventName": "PreToolUse",
      "permissionDecision": "deny",
      "permissionDecisionReason": "Possible secret detected in commit command. Review before committing."
    }
  }'
  exit 0
fi

exit 0
