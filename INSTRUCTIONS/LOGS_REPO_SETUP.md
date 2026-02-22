# Logs Repository Setup

This document provides complete instructions for creating and managing a separate git repository dedicated to:
- Workflow instructions and documentation
- Debug session results and logs
- System configuration snapshots (etckeeper exports)
- Action audit trail

---

## Overview

**Purpose**: Maintain a complete, version-controlled audit trail of all debugging sessions and system changes.

**Structure**:
```
~/src/hbosng-logs/
├── README.md                          # This repo's purpose
├── INSTRUCTIONS/
│   ├── SYSTEMATIC_SETUP.md           # Setup workflow
│   ├── AI_DEBUGGING_WORKFLOW.md       # Debugging workflow
│   └── LOGS_REPO_SETUP.md            # This file
├── SESSIONS/
│   └── debug_2026-02-22_194530.md    # Individual session files
├── EXPORTS/
│   ├── etckeeper_snapshots/          # /etc git history snapshots
│   ├── action_logs/                  # Copies of action.md per session
│   └── verification_results/         # Test/verification outputs
└── INDEX.md                           # Master index of all sessions
```

---

## Step 1: Initialize the Logs Repository

### 1.1 Create Repository Directory

```bash
cd ~/src
mkdir -p hbosng-logs
cd hbosng-logs
git init
```

### 1.2 Create Initial Structure

```bash
mkdir -p INSTRUCTIONS SESSIONS EXPORTS/{etckeeper_snapshots,action_logs,verification_results}
```

### 1.3 Create README

```bash
cat > README.md << 'EOF'
# HiFiBerry OS NG - Logs & Documentation Repository

This repository maintains:
- **Instructions**: Setup workflows, debugging procedures, system guides
- **Session Logs**: Complete record of each debugging session with timestamps
- **System Snapshots**: Exported /etc git history and configuration snapshots
- **Action Audit Trail**: Record of all executed commands and their results

## Repository Structure

```
hbosng-logs/
├── INSTRUCTIONS/          # Workflow and setup documentation
├── SESSIONS/              # Individual debug session logs
├── EXPORTS/               # System snapshots and backups
│   ├── etckeeper_snapshots/
│   ├── action_logs/
│   └── verification_results/
└── INDEX.md               # Master index of all sessions
```

## Key Files

- `INSTRUCTIONS/SYSTEMATIC_SETUP.md` - Complete Pi/Git/VS Code setup guide
- `INSTRUCTIONS/AI_DEBUGGING_WORKFLOW.md` - Safe debugging with rollback
- `INDEX.md` - Searchable index of all sessions and findings

## Quick Links

- View all sessions: `INDEX.md`
- Latest session: See SESSIONS/ directory, sorted by date
- System state: EXPORTS/etckeeper_snapshots/

## Contributing Sessions

When completing a debug session:
1. Copy session file: `cp ~/logs/hifiberryng/debug_*.md SESSIONS/`
2. Export etckeeper snapshot: `sudo git -C /etc export-pack EXPORTS/etckeeper_snapshots/[timestamp].tar.gz`
3. Update INDEX.md with session summary
4. Commit: `git add -A && git commit -m "session: [description]"`

EOF
cat README.md
```

### 1.4 Create .gitignore

```bash
cat > .gitignore << 'EOF'
# Temporary files
*.tmp
*.swp
*.swo
*~

# OS files
.DS_Store
Thumbs.db

# Secrets (if any)
.env
secrets/

# Large files (keep exported only)
*.iso
*.img

# Cache
__pycache__/
*.pyc
EOF
```

### 1.5 Create Initial Commit

```bash
git add .
git commit -m "initial: create hbosng-logs repository structure"
```

---

## Step 2: Copy Instructions to Repo

### 2.1 Copy Workflow Documents

```bash
cp /home/timmo/systematic_setup.md INSTRUCTIONS/
cp /home/timmo/AI_DEBUGGING_WORKFLOW.md INSTRUCTIONS/
cp /home/timmo/LOGS_REPO_SETUP.md INSTRUCTIONS/

git add INSTRUCTIONS/
git commit -m "docs: add workflow instructions"
```

### 2.2 Create Documentation Index

```bash
cat > INSTRUCTIONS/README.md << 'EOF'
# Workflow Instructions

Complete guides for HiFiBerry OS NG development and debugging.

## Documents

### SYSTEMATIC_SETUP.md
Comprehensive setup guide covering:
- Raspberry Pi baseline (Debian, SSH, networking)
- Audio board sanity checks (HiFiBerry DAC)
- GitHub workflow (fork, clone, branches)
- VS Code remote development
- AI assistance patterns
- Developer environment setup
- Deployment procedures
- Rollback playbook

**When to use**: Initial setup, reviewing best practices, planning major changes

### AI_DEBUGGING_WORKFLOW.md
Safe debugging workflow with complete rollback capability:
- Planning & documentation phase
- Pre-execution snapshots (git + etckeeper)
- Execution with full logging
- Post-execution verification
- Emergency rollback procedures
- Example session templates

**When to use**: Before starting any debugging work, use as SOP

### LOGS_REPO_SETUP.md
This repository's administration guide:
- Repository structure and purpose
- Adding new sessions
- Exporting system snapshots
- Maintaining the index

**When to use**: Setting up the logs repo, adding new debug sessions

EOF
cat INSTRUCTIONS/README.md
```

---

## Step 3: Create Master Session Index

### 3.1 Create INDEX.md

```bash
cat > INDEX.md << 'EOF'
# Session Index

Master record of all debugging sessions, organized by date and status.

## Active Sessions

| Date | Session ID | Issue | Status | Git Commits | Notes |
|------|-----------|-------|--------|-------------|-------|
| 2026-02-22 | debug_2026-02-22_194530 | Audio device detection | ✅ Success | a1b2c3d4..i9j0k1l2 | Device already working |

## Completed Sessions

None yet.

## Failed/Reverted Sessions

| Date | Session ID | Issue | Reason | Rollback Details |
|------|-----------|-------|--------|-----------------|

## Statistics

- **Total Sessions**: 1
- **Success Rate**: 100%
- **Average Duration**: 4m 45s
- **Files Modified Per Session**: 0-5

## Searching Sessions

By issue type:
- Audio: debug_2026-02-22_194530
- Network: [none yet]
- System Config: [none yet]
- Debugging: All sessions

By timeframe:
- February 2026: debug_2026-02-22_194530

## How to Update This Index

After each session:
1. Add row to appropriate section
2. Include session ID, brief summary, git commit range
3. Update statistics
4. Commit with: `git add INDEX.md && git commit -m "index: add session [id]"`

EOF
cat INDEX.md
```

### 3.2 Commit the Index

```bash
git add INDEX.md
git commit -m "index: create master session index"
```

---

## Step 4: Export etckeeper Snapshots

### 4.1 Create etckeeper Export Function

Add this to your `~/.bashrc`:

```bash
export_etckeeper_snapshot() {
    local timestamp=$(date +%Y-%m-%d_%H%M%S)
    local export_dir="$HOME/src/hbosng-logs/EXPORTS/etckeeper_snapshots"
    local filename="${export_dir}/etc_snapshot_${timestamp}.tar.gz"
    
    echo "Exporting /etc git snapshot..."
    sudo tar -czf "${filename}" -C /etc .git 2>/dev/null || {
        echo "Note: Some .git files may not be readable"
    }
    
    echo "Exported to: ${filename}"
    ls -lh "${filename}"
}
```

Then reload:
```bash
source ~/.bashrc
```

### 4.2 Capture First Snapshot

```bash
export_etckeeper_snapshot

# Verify it exists
ls -lh ~/src/hbosng-logs/EXPORTS/etckeeper_snapshots/
```

### 4.3 Commit Snapshot

```bash
cd ~/src/hbosng-logs
git add EXPORTS/
git commit -m "snapshot: initial /etc configuration"
```

---

## Step 5: Create Action Log Export

### 5.1 Create Export Function

Add to `~/.bashrc`:

```bash
export_action_log() {
    local timestamp=$(date +%Y-%m-%d_%H%M%S)
    local action_log="$HOME/action.md"
    local export_dir="$HOME/src/hbosng-logs/EXPORTS/action_logs"
    local filename="${export_dir}/action_log_${timestamp}.md"
    
    if [ ! -f "$action_log" ]; then
        echo "Error: $action_log not found"
        return 1
    fi
    
    cp "$action_log" "$filename"
    echo "Exported action log to: ${filename}"
}
```

### 5.2 Export Initial Log

```bash
export_action_log

# Verify
ls -lh ~/src/hbosng-logs/EXPORTS/action_logs/
```

### 5.3 Commit

```bash
cd ~/src/hbosng-logs
git add EXPORTS/action_logs/
git commit -m "export: initial action log"
```

---

## Step 6: Create Session Import Script

Create a helper script for managing sessions:

```bash
cat > ~/src/hbosng-logs/import_session.sh << 'EOF'
#!/bin/bash

# Import a completed debug session into the logs repository

set -euo pipefail

LOGS_REPO="$HOME/src/hbosng-logs"
SESSIONS_DIR="$LOGS_REPO/SESSIONS"

if [ $# -lt 1 ]; then
    echo "Usage: $0 <session_file>"
    echo "Example: $0 ~/logs/hifiberryng/debug_2026-02-22_194530.md"
    exit 1
fi

SESSION_FILE="$1"

if [ ! -f "$SESSION_FILE" ]; then
    echo "Error: Session file not found: $SESSION_FILE"
    exit 1
fi

# Extract session ID from filename
SESSION_ID=$(basename "$SESSION_FILE" .md)

# Copy to logs repo
cp "$SESSION_FILE" "$SESSIONS_DIR/"
echo "✅ Copied session to: $SESSIONS_DIR/$SESSION_ID.md"

# Export action log
export_action_log
echo "✅ Exported action log"

# Export etckeeper snapshot
export_etckeeper_snapshot
echo "✅ Exported /etc snapshot"

# Commit all
cd "$LOGS_REPO"
git add SESSIONS/ EXPORTS/
git commit -m "session: add $SESSION_ID with snapshots"
echo "✅ Committed to logs repository"

# Show summary
echo ""
echo "Session imported successfully!"
echo "Files:"
git show --name-only --format="%H" -1 | tail -n +2 | sed 's/^/  /'
EOF

chmod +x ~/src/hbosng-logs/import_session.sh
```

---

## Step 7: Link Repos Together

### 7.1 Add Reference in hbosng

Create a pointer in the main repo:

```bash
cat > ~/src/hbosng/LOGS_README.md << 'EOF'
# Debugging & Logs Repository

Detailed logs, debug sessions, and documentation are maintained in a separate repository:

```bash
~/src/hbosng-logs/
```

## Key References

- **Workflow Instructions**: `~/src/hbosng-logs/INSTRUCTIONS/`
- **Debug Sessions**: `~/src/hbosng-logs/SESSIONS/`
- **System Snapshots**: `~/src/hbosng-logs/EXPORTS/`
- **Session Index**: `~/src/hbosng-logs/INDEX.md`

## Quick Import Session

After completing a debug session:

```bash
~/src/hbosng-logs/import_session.sh ~/logs/hifiberryng/debug_*.md
```

This automatically:
1. Copies session file to logs repo
2. Exports /etc configuration snapshot
3. Exports action log
4. Commits everything with proper metadata

See `~/src/hbosng-logs/INSTRUCTIONS/AI_DEBUGGING_WORKFLOW.md` for complete workflow.
EOF

git add LOGS_README.md
git commit -m "docs: add reference to logs repository"
```

### 7.2 Create .gitmodule Alternative (Optional)

If you want to track both repos together:

```bash
# From ~/src, add hbosng-logs as a submodule (optional)
cd ~/src
git -C hbosng submodule add ../hbosng-logs hbosng-logs
git -C hbosng commit -m "docs: add hbosng-logs as reference"
```

---

## Step 8: Configure Remote (GitHub)

### 8.1 Create GitHub Repository

On GitHub.com:
1. Create new repository: `hbosng-logs`
2. Owner: `timmost`
3. Private (recommended, contains debug info)
4. Initial commit: Already done locally

### 8.2 Add Remote and Push

```bash
cd ~/src/hbosng-logs
git remote add origin https://github.com/timmost/hbosng-logs.git
git branch -M main
git push -u origin main
```

### 8.3 Verify

```bash
git remote -v
# Should show:
# origin  https://github.com/timmost/hbosng-logs.git (fetch)
# origin  https://github.com/timmost/hbosng-logs.git (push)
```

---

## Step 9: Automated Session Archival

### 9.1 Create Cron Job (Optional)

For automatic daily archival of session logs:

```bash
# Edit crontab
crontab -e

# Add this line:
0 2 * * * cd ~/src/hbosng-logs && git add -A && git commit -m "archive: daily backup $(date +\%Y-\%m-\%d)" 2>/dev/null || true
```

This commits any untracked session changes daily at 2 AM.

---

## Integration with Debugging Workflow

### When Starting a Session

1. Follow `INSTRUCTIONS/AI_DEBUGGING_WORKFLOW.md`
2. Create session file in `~/logs/hifiberryng/`
3. Document all steps as per workflow

### When Completing a Session

1. Verify session file is saved
2. Run: `~/src/hbosng-logs/import_session.sh ~/logs/hifiberryng/debug_[timestamp].md`
3. Update `INDEX.md` with session summary
4. Push to GitHub: `git -C ~/src/hbosng-logs push`

### When Reviewing Past Sessions

```bash
cd ~/src/hbosng-logs

# See all sessions
ls SESSIONS/

# Check a specific session
cat SESSIONS/debug_2026-02-22_194530.md

# View session index
cat INDEX.md

# See /etc changes from a session
tar -tzf EXPORTS/etckeeper_snapshots/etc_snapshot_*.tar.gz | head

# View action log from session
cat EXPORTS/action_logs/action_log_*.md
```

---

## Complete Setup Checklist

- [ ] Create `~/src/hbosng-logs` directory
- [ ] Initialize git repo: `git init`
- [ ] Create directory structure (INSTRUCTIONS, SESSIONS, EXPORTS/)
- [ ] Copy workflow instructions to INSTRUCTIONS/
- [ ] Create README.md and .gitignore
- [ ] Create INDEX.md for session tracking
- [ ] Add etckeeper snapshot export function to ~/.bashrc
- [ ] Add action log export function to ~/.bashrc
- [ ] Create import_session.sh helper script
- [ ] Export initial etckeeper snapshot
- [ ] Export initial action log
- [ ] Make initial commit: "initial: create hbosng-logs repository"
- [ ] Create remote on GitHub
- [ ] Push to remote: `git push -u origin main`
- [ ] Test workflow with first debug session
- [ ] Update LOGS_REPO_SETUP.md in logs repo if modifications made

---

## Directory Reference

```
~/src/
├── hbosng/                    # Main HiFiBerry OS code
│   └── LOGS_README.md        # Pointer to logs repo
└── hbosng-logs/              # Logs & documentation repo
    ├── README.md
    ├── INDEX.md              # Master session index
    ├── INSTRUCTIONS/
    │   ├── SYSTEMATIC_SETUP.md
    │   ├── AI_DEBUGGING_WORKFLOW.md
    │   └── LOGS_REPO_SETUP.md
    ├── SESSIONS/
    │   └── debug_2026-02-22_194530.md
    └── EXPORTS/
        ├── etckeeper_snapshots/
        │   └── etc_snapshot_2026-02-22_192458.tar.gz
        ├── action_logs/
        │   └── action_log_2026-02-22_192458.md
        └── verification_results/
```

---

## Summary

You now have:

1. **Version-controlled logs**: All debugging sessions tracked in git
2. **Complete audit trail**: Every command, result, and system state captured
3. **Easy recovery**: Full git history allows revert to any previous state
4. **Documentation**: Workflow guides available alongside results
5. **System snapshots**: /etc configuration history preserved
6. **Searchable index**: Master index of all sessions for quick lookup

Next: Follow `INSTRUCTIONS/AI_DEBUGGING_WORKFLOW.md` to conduct your first formal debug session using this infrastructure.
