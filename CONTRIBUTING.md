# Contributing Sessions to hbosng-logs

This guide explains how to contribute completed debug sessions to the logs repository. After completing a debugging session using `AI_DEBUGGING_WORKFLOW.md`, follow these steps to archive your work.

---

## Overview

Contributing sessions ensures:
- **Audit Trail**: Complete record of all changes and their reasoning
- **Rollback Safety**: Full git history allowing reversion if needed
- **Knowledge Sharing**: Sessions are searchable and documented
- **Compliance**: System configuration and code changes are tracked

---

## Quick Start

After a debug session:

```bash
# 1. Import session file
~/src/hbosng-logs/import_session.sh ~/logs/hifiberryng/debug_YYYY-MM-DD_HHMMSS.md

# 2. If you modified /etc
cd /etc && sudo git bundle create \
  ~/src/hbosng-logs/EXPORTS/etckeeper_snapshots/etc_$(date +%Y%m%d_%H%M%S).bundle --all
cd ~/src/hbosng-logs && git add EXPORTS/etckeeper_snapshots/ && \
  git commit -m "exports: add etckeeper snapshot"

# 3. Export action log
cp ~/action.md ~/src/hbosng-logs/EXPORTS/action_logs/action_$(date +%Y%m%d).md
cd ~/src/hbosng-logs && git add EXPORTS/action_logs/ && \
  git commit -m "logs: export action log"

# 4. Update index
# (edit ~/src/hbosng-logs/INDEX.md to add your session row)
cd ~/src/hbosng-logs && git add INDEX.md && \
  git commit -m "index: add session - [description]"

# 5. Push to GitHub
cd ~/src/hbosng-logs && git push origin main
```

---

## Detailed Steps

### Step 1: Import Session File

Your session file is created during debugging at:
```
~/logs/hifiberryng/debug_YYYY-MM-DD_HHMMSS.md
```

**Option A: Using the helper script (recommended)**

```bash
~/src/hbosng-logs/import_session.sh ~/logs/hifiberryng/debug_2026-02-22_192458.md
```

This automatically:
- Copies the session file to `SESSIONS/debug_2026-02-22_192458.md`
- Stages the file in git
- Creates commit: `session: add debug_2026-02-22_192458`

**Option B: Manual copy**

```bash
# Copy session file
cp ~/logs/hifiberryng/debug_*.md ~/src/hbosng-logs/SESSIONS/

# Commit
cd ~/src/hbosng-logs
git add SESSIONS/
git commit -m "session: add debug_2026-02-22_192458 - [brief description]"
```

---

### Step 2: Export etckeeper Snapshot

**Only if you modified `/etc` configuration**

Check what changed:
```bash
cd /etc && sudo git status
```

If there are changes, export and commit:

```bash
# Create bundle of all /etc history up to now
cd /etc
sudo git bundle create \
  ~/src/hbosng-logs/EXPORTS/etckeeper_snapshots/etc_$(date +%Y%m%d_%H%M%S).bundle \
  --all

# Commit the export
cd ~/src/hbosng-logs
git add EXPORTS/etckeeper_snapshots/
git commit -m "exports: add etckeeper snapshot from session [SESSION_ID]"
```

**What's in the bundle?**
- Complete git history of `/etc` directory
- All commits and changes over time
- Can be restored later if needed

---

### Step 3: Export Action Log

Export current action log to preserve a dated copy:

```bash
# Copy with today's date
cp ~/action.md \
  ~/src/hbosng-logs/EXPORTS/action_logs/action_$(date +%Y%m%d).md

# Commit
cd ~/src/hbosng-logs
git add EXPORTS/action_logs/
git commit -m "logs: export action log for $(date +%Y-%m-%d)"
```

This creates a timestamped snapshot: `action_20260222.md`

---

### Step 4: Update Session Index

Update the master index to record your session:

**File**: `~/src/hbosng-logs/INDEX.md`

Find the "Completed Sessions" section and add a row:

```markdown
| 2026-02-22 | debug_2026-02-22_192458 | Audio device detection | ✅ Success | 4m 45s | 3 |
```

**Fields**:
- **Date**: When the session occurred
- **Session ID**: `debug_YYYY-MM-DD_HHMMSS` format
- **Issue**: Brief description of what was debugged
- **Status**: ✅ Success, ⚠️ Partial, ❌ Failed
- **Duration**: How long the session took
- **Files Changed**: Number of files modified

Then commit:

```bash
cd ~/src/hbosng-logs
git add INDEX.md
git commit -m "index: add session $(date +%Y-%m-%d) - [brief description]"
```

---

### Step 5: Push to GitHub

Push all changes to GitHub:

```bash
cd ~/src/hbosng-logs
git push origin main
```

Verify:
```bash
git log --oneline -5
```

---

## File Structure After Contributing

After contributing a complete session, the repository looks like:

```
hbosng-logs/
├── SESSIONS/
│   └── debug_2026-02-22_192458.md          ← Your session file
├── EXPORTS/
│   ├── action_logs/
│   │   ├── action_20260215.md
│   │   └── action_20260222.md              ← Exported today
│   ├── etckeeper_snapshots/
│   │   └── etc_20260222_120000.bundle      ← /etc backup (if needed)
│   └── verification_results/
├── INDEX.md                                 ← Updated with your session
└── [other files...]
```

---

## Complete Checklist

Run through this checklist after each debug session:

- [ ] **Session Planning**: Session file created with clear issue description
- [ ] **Session Execution**: Changes made and tested per `AI_DEBUGGING_WORKFLOW.md`
- [ ] **Session Complete**: Session file finalized with summary and commit SHAs
- [ ] **Import Session**: Session file copied to `SESSIONS/` and committed
- [ ] **etckeeper Export**: /etc snapshot exported (if /etc was modified)
- [ ] **Action Log Export**: Action log copied to `EXPORTS/action_logs/`
- [ ] **Index Updated**: Session row added to `INDEX.md`
- [ ] **Push to GitHub**: All changes pushed to origin
- [ ] **Main Repo Updated**: hbosng repository updated (if applicable)
- [ ] **Main Repo Pushed**: hbosng changes pushed to origin

---

## Example: Completed Contribution

Here's what a fully contributed session looks like:

**1. Session file**:
```
SESSIONS/debug_2026-02-22_192458.md
```

**2. Commits created**:
```
d9e8f7g6 index: add session 2026-02-22 - Audio device detection fix
c8d7e6f5 logs: export action log for 2026-02-22
b7c6d5e4 exports: add etckeeper snapshot from session debug_2026-02-22_192458
a6b5c4d3 session: add debug_2026-02-22_192458 - Audio device detection fix
```

**3. INDEX.md entry**:
```
| 2026-02-22 | debug_2026-02-22_192458 | Audio device detection | ✅ Success | 4m 45s | 3 |
```

**4. GitHub status**:
```
✅ All changes pushed to origin
✅ Session discoverable in INDEX.md
✅ Full audit trail available via git log
✅ Rollback possible via git reset/revert
```

---

## Troubleshooting

### "import_session.sh: command not found"

```bash
# Make script executable
chmod +x ~/src/hbosng-logs/import_session.sh

# Or use full path
~/src/hbosng-logs/import_session.sh ~/logs/hifiberryng/debug_*.md
```

### etckeeper export fails

```bash
# Check if etckeeper is initialized
sudo git -C /etc status

# If not initialized:
cd /etc && sudo etckeeper init
```

### Cannot push to GitHub

```bash
# Check remote
git remote -v

# Test connection
git ls-remote origin

# If no access, configure SSH/HTTPS key
# See: https://docs.github.com/en/authentication
```

---

## Guidelines

### Session File Naming

Use the format: `debug_YYYY-MM-DD_HHMMSS.md`

Example:
- `debug_2026-02-22_192458.md` ← Session at 19:24:58
- `debug_2026-02-23_093015.md` ← Session at 09:30:15

### Commit Messages

Use clear, descriptive commit messages:

```
✅ Good:
  "session: add debug_2026-02-22_192458 - Fixed audio device detection via ALSA config"
  "exports: add etckeeper snapshot - System config changes for DAC setup"
  "index: add session - Audio configuration debugging"

❌ Avoid:
  "update" 
  "session changes"
  "debug stuff"
```

### INDEX.md Format

Keep entries consistent:

```markdown
| Date | Session ID | Issue | Status | Duration | Files Changed |
|------|-----------|-------|--------|----------|---------------|
| 2026-02-22 | debug_2026-02-22_192458 | Brief issue title | ✅ | 4m 45s | 3 |
```

- **Status symbols**: ✅ Success, ⚠️ Partial Success, ❌ Failed
- **Duration**: `Xm Ys` format (e.g., `4m 45s`)
- **Files Changed**: Count of files modified

---

## Related Documentation

- **Debugging Workflow**: [AI_DEBUGGING_WORKFLOW.md](INSTRUCTIONS/AI_DEBUGGING_WORKFLOW.md)
- **Setup Instructions**: [systematic_setup.md](INSTRUCTIONS/systematic_setup.md)
- **Logs Admin**: [LOGS_REPO_SETUP.md](INSTRUCTIONS/LOGS_REPO_SETUP.md)
- **All Sessions**: [INDEX.md](INDEX.md)

---

## Questions?

Refer to:
1. `INSTRUCTIONS/AI_DEBUGGING_WORKFLOW.md` - Full debugging workflow
2. `INDEX.md` - Examples of completed sessions
3. `.git/logs/` - See all commits and changes

