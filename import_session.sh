#!/bin/bash

# Import a completed debug session into the logs repository

set -euo pipefail

LOGS_REPO="$HOME/src/hbosng-logs"
SESSIONS_DIR="$LOGS_REPO/SESSIONS"

if [ $# -lt 1 ]; then
    echo "Usage: import_session.sh <session_file>"
    echo "Example: import_session.sh ~/logs/hifiberryng/debug_2026-02-22_194530.md"
    exit 1
fi

SESSION_FILE="$1"

if [ ! -f "$SESSION_FILE" ]; then
    echo "Error: Session file not found: $SESSION_FILE"
    exit 1
fi

# Extract session ID from filename
SESSION_ID=$(basename "$SESSION_FILE" .md)

echo "Importing session: $SESSION_ID"

# Copy to logs repo
cp "$SESSION_FILE" "$SESSIONS_DIR/"
echo "✅ Copied session to: $SESSIONS_DIR/$SESSION_ID.md"

# Commit all
cd "$LOGS_REPO"
git add SESSIONS/
git commit -m "session: add $SESSION_ID"
echo "✅ Committed to logs repository"

echo ""
echo "Session imported successfully!"
echo ""
echo "Next steps:"
echo "1. Update INDEX.md with session summary"
echo "2. Review session file: cat SESSIONS/$SESSION_ID.md"
echo "3. Push to remote: git push origin main"
