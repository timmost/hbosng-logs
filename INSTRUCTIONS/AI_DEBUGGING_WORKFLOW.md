# AI-Supported Debugging Workflow

This workflow ensures safe, traceable debugging sessions with complete rollback capability. All changes are documented, version-controlled, and can be reverted at any point.

---

## Overview

Each debugging session follows this sequence:

```
PLAN → DOCUMENT → PRE-SNAPSHOT → EXECUTE → VERIFY → POST-SNAPSHOT → COMMIT
```

---

## Phase 1: Planning & Documentation

### 1.1 Create Session Plan File

Create a unique file in `~/logs/hifiberryng/` for this session:

```bash
SESSION_DATE=$(date +%Y-%m-%d_%H%M%S)
SESSION_FILE="~/logs/hifiberryng/debug_${SESSION_DATE}.md"
```

### 1.2 Document the Problem

In your new session file, create this structure:

```markdown
# Debug Session: [Brief Issue Title]

**Session ID**: debug_2026-02-22_192458  
**Started**: 2026-02-22 19:24:58  
**Issue**: [What are you debugging?]

## Expected Outcome
[What should happen after the fix?]

## Hypothesis
[Why do you think this will fix it?]

## Changes Planned
- [ ] Change 1
- [ ] Change 2
- [ ] Change 3

## Rollback Plan
If something breaks:
1. [First rollback step]
2. [Second rollback step]

---

## Execution Log

[Filled in during execution phase]
```

### 1.3 Checklist Before Starting

- [ ] Session plan file created with clear problem statement
- [ ] Expected outcome documented
- [ ] Hypothesis explained
- [ ] All planned changes listed
- [ ] Rollback plan written
- [ ] Terminal is ready (tmux session?)
- [ ] Action log accessible at `~/action.md`

---

## Phase 2: Pre-Execution Snapshots

### 2.1 Create Git Feature Branch

```bash
BRANCH_NAME="timmo/debug-${SESSION_DATE}-issue-title"
cd ~/src/hbosng
git checkout -b "${BRANCH_NAME}"
```

**Record in session file:**
```
### Git Branch
Created: git checkout -b timmo/debug-2026-02-22_192458-issue-title
```

### 2.2 Git Baseline Commit

Commit current clean state before making any changes:

```bash
cd ~/src/hbosng
git add .
git status  # Verify nothing unexpected is staged
git commit -m "baseline: before debug session for [issue description]"
```

**Record baseline commit SHA:**
```
git log --oneline -1
```

**Document in session file:**
```
### Pre-Execution Git Snapshot
Baseline Commit: 7a3f1b2c
Message: "baseline: before debug session for [issue description]"
Branch: timmo/debug-2026-02-22_192458-issue-title
```

### 2.3 etckeeper Snapshot (System Config)

```bash
cd /etc
sudo git status

# If changes exist, commit them first
sudo git add -A
sudo git commit -m "baseline: before debug session on 2026-02-22_192458"

# Record the commit
sudo git log --oneline -1
```

**Document in session file:**
```
### Pre-Execution etckeeper Snapshot
Commit: abc3def4
Message: "baseline: before debug session on 2026-02-22_192458"
Note: [Any config drift noted?]
```

### 2.4 Optional: Directory Snapshot

For visual reference, capture directory structure:

```bash
tree -L 2 ~/src/hbosng > ~/logs/hifiberryng/structure_before_${SESSION_DATE}.txt
```

**Pre-Execution Checklist**

- [ ] Feature branch created: `git branch` shows active branch
- [ ] Baseline git commit recorded with clear message
- [ ] Baseline commit SHA documented in session file
- [ ] etckeeper snapshot taken and recorded
- [ ] No uncommitted changes remain: `git status` is clean
- [ ] No /etc drift: `cd /etc && sudo git status` is clean
- [ ] Session plan file updated with all snapshots
- [ ] Ready to execute changes

---

## Phase 3: Execution

### 3.1 Run Commands with Full Logging

In your tmux session, ensure all commands are logged:

```bash
# Start logging (or ensure it's already running)
script -af ~/logs/hifiberryng/session_${SESSION_DATE}_execution.log
```

### 3.2 Execute Planned Changes

For each planned change:

1. **Document the change**:
   ```bash
   echo "=== CHANGE 1: Modifying file X ===" >> ~/logs/hifiberryng/debug_${SESSION_DATE}.md
   ```

2. **Make the change**:
   ```bash
   # Your actual command here
   sudo nano /path/to/file
   # or
   python3 script.py
   ```

3. **Verify the change took effect**:
   ```bash
   # Run verification steps
   cat /path/to/file
   # or
   aplay -l  # etc.
   ```

4. **Log the result**:
   ```markdown
   **Change 1 Result**: ✅ Success / ❌ Failed
   Details: [What happened?]
   Output:
   ```
   [relevant output here]
   ```
   ```

### 3.3 Update Session File During Execution

Add actual results to the execution log section:

```markdown
## Execution Log

### Change 1: [Description]
**Timestamp**: 2026-02-22 19:25:12  
**Command**: sudo nano /etc/config.txt  
**Result**: ✅ Success  
**Output**:
```
[command output]
```

### Change 2: [Description]
**Timestamp**: 2026-02-22 19:26:30  
**Command**: systemctl restart service  
**Result**: ✅ Success  
**Output**:
```
[command output]
```
```

### 3.4 Test & Verify Changes

After each change, run verification:

```bash
# Example verification commands
aplay -l                    # Check audio
arecord -l                  # Check input
systemctl status service    # Check service
dmesg | tail -n 50          # Check kernel logs
sudo journalctl -n 50 -u service  # Check service logs
```

**Document results**:
```markdown
### Verification
- [ ] Change A working as expected
- [ ] Change B verified via [test method]
- [ ] No new errors introduced
- [ ] Service restart successful
```

---

## Phase 4: Post-Execution Snapshots

### 4.1 Git Commit Changes

After all changes are completed and verified:

```bash
cd ~/src/hbosng
git add -A
git status  # Review all changes

# If changes look good
git commit -m "debug: [brief description of fixes applied]

This commit contains the following changes:
- Fix for issue 1: [description]
- Fix for issue 2: [description]

Session ID: debug_2026-02-22_192458
Session Log: ~/logs/hifiberryng/debug_2026-02-22_192458.md

Tested with: [what testing was done]
"
```

**Record post-execution commit:**
```bash
git log --oneline -1  # Get the commit SHA
```

**Document in session file:**
```
### Post-Execution Git Commit
Commit: 9x8y7z6w
Message: "debug: fixes for issue X"
Changes: [number of files modified]
```

### 4.2 etckeeper Snapshot (After Changes)

```bash
cd /etc
sudo git add -A
sudo git commit -m "debug: config changes from session 2026-02-22_192458

Changes:
- Modified [config file 1]
- Modified [config file 2]

Session: ~/logs/hifiberryng/debug_2026-02-22_192458.md
"

sudo git log --oneline -1
```

**Document in session file:**
```
### Post-Execution etckeeper Snapshot
Commit: def5ghi6
Message: "debug: config changes from session 2026-02-22_192458"
Changed files: [list]
```

### 4.3 Final Verification

```bash
# Run comprehensive verification
echo "=== Final System Check ===" 
uname -a
aplay -l
arecord -l
sudo systemctl status hifiberryng  # or relevant service
sudo journalctl --no-pager -n 100 | head -50

# Document in session file
```

**Post-Execution Checklist**

- [ ] All changes tested and verified
- [ ] Git commit created with clear message
- [ ] Git commit SHA documented
- [ ] etckeeper snapshot taken
- [ ] etckeeper commit SHA documented
- [ ] Final verification tests run
- [ ] Session file complete and saved
- [ ] Output log saved to `~/logs/hifiberryng/`

---

## Phase 5: Documentation & Closeout

### 5.1 Complete Session File

Add final summary:

```markdown
## Summary

**Status**: ✅ Success / ⚠️ Partial / ❌ Failed

**Final Outcome**: [Did it fix the original issue?]

**Commits**:
- Pre-execution: 7a3f1b2c
- Post-execution: 9x8y7z6w
- etckeeper pre: abc3def4
- etckeeper post: def5ghi6

**Time Spent**: [start time] → [end time]

**Next Steps**: [What should be done next?]

**Notes**: [Any gotchas or discoveries?]
```

### 5.2 Update Action Log

Add session summary to `~/action.md`:

```markdown
### Debug Session: [Issue Title]
- **Session ID**: debug_2026-02-22_192458
- **Date**: 22 February 2026
- **Status**: ✅ Success
- **Git Commits**: 
  - Baseline: 7a3f1b2c
  - Changes: 9x8y7z6w
- **etckeeper Commits**:
  - Baseline: abc3def4
  - Changes: def5ghi6
- **Session Log**: ~/logs/hifiberryng/debug_2026-02-22_192458.md
- **Changes Applied**: [summary of changes]
```

### 5.3 Create Pull Request (Optional)

If changes are solid, push to fork and create PR:

```bash
cd ~/src/hbosng
git push -u origin timmo/debug-2026-02-22_192458-issue-title

# Then open PR on GitHub
# Title: "debug: [issue description]"
# Description: [copy relevant parts from session file]
```

---

## Phase 6: Contribute to Logs Repository

After each debug session completes, contribute your work to the logs repository for archival and audit trail:

### 6.1 Import Session File

Copy the completed session file to the logs repository:

```bash
# Method 1: Using helper script (quickest)
~/src/hbosng-logs/import_session.sh ~/logs/hifiberryng/debug_YYYY-MM-DD_HHMMSS.md

# Method 2: Manual copy
cp ~/logs/hifiberryng/debug_*.md ~/src/hbosng-logs/SESSIONS/
```

**What this does**:
- Copies session file to `SESSIONS/` directory
- Stages all changes for commit
- Creates git commit with session metadata

### 6.2 Export etckeeper Snapshot (if applicable)

If your session modified system configuration in `/etc`:

```bash
# Export /etc git history
cd /etc
sudo git bundle create \
  ~/src/hbosng-logs/EXPORTS/etckeeper_snapshots/etc_$(date +%Y%m%d_%H%M%S).bundle \
  --all

# Commit to logs repo
cd ~/src/hbosng-logs
git add EXPORTS/etckeeper_snapshots/
git commit -m "exports: add etckeeper snapshot from session [SESSION_ID]"
```

### 6.3 Export Action Log

Add timestamped copy of action log to logs repository:

```bash
# Export current action log
cp ~/action.md ~/src/hbosng-logs/EXPORTS/action_logs/action_$(date +%Y%m%d).md

# Commit to logs repo
cd ~/src/hbosng-logs
git add EXPORTS/action_logs/
git commit -m "logs: export action log for $(date +%Y-%m-%d)"
```

### 6.4 Update Session Index

Update `~/src/hbosng-logs/INDEX.md` to record the completed session:

```markdown
| Date | Session ID | Issue | Status | Duration | Files Changed |
|------|-----------|-------|--------|----------|---------------|
| 2026-02-22 | debug_2026-02-22_192458 | Audio device detection | ✅ Success | 4m 45s | 3 |
```

Then commit:

```bash
cd ~/src/hbosng-logs
git add INDEX.md
git commit -m "index: add session $(date +%Y-%m-%d) - [brief description]"
```

### 6.5 Push to GitHub

Push the updated logs repository to GitHub:

```bash
cd ~/src/hbosng-logs
git push origin main
```

### Complete Contributing Checklist

After completing a debug session:

- [ ] Session file finalized in `~/logs/hifiberryng/`
- [ ] Session file copied to `~/src/hbosng-logs/SESSIONS/`
- [ ] Git commit created: `git add SESSIONS/ && git commit -m "session: [id]"`
- [ ] etckeeper snapshot exported (if /etc was modified)
- [ ] etckeeper snapshot committed
- [ ] Action log exported to EXPORTS/action_logs/
- [ ] Action log committed
- [ ] INDEX.md updated with session summary
- [ ] Index commit created
- [ ] Changes pushed to GitHub: `git push origin main`
- [ ] Main hbosng repository updated if applicable
- [ ] Main repository changes pushed to origin

**Result**: Complete audit trail of all changes, with full rollback capability via git history.

---

## Emergency Rollback

If something breaks during execution, rollback is straightforward:

### Rollback via Git (Code Changes)

```bash
# See what commits exist
git log --oneline -5

# Rollback to pre-execution baseline
git reset --hard 7a3f1b2c  # [pre-execution commit SHA]
# or
git revert 9x8y7z6w        # [post-execution commit SHA]
```

### Rollback via etckeeper (Config Changes)

```bash
cd /etc
sudo git log --oneline -5
sudo git reset --hard abc3def4  # [pre-execution commit SHA]
# or
sudo git revert def5ghi6        # [post-execution commit SHA]
```

### Nuclear Option

If git rollback doesn't work:

1. Re-flash SD card from backup image
2. Document in action log what went wrong
3. Create new session file analyzing the failure
4. Plan more conservative approach

---

## Example Session File Template

```markdown
# Debug Session: Audio Device Not Detected

**Session ID**: debug_2026-02-22_194530  
**Started**: 2026-02-22 19:45:30  
**Issue**: aplay -l shows no HiFiBerry DAC

## Expected Outcome
After fixes, `aplay -l` should show:
- Card 0: HiFiBerry DAC
- Card 1: HDMI audio

## Hypothesis
The device tree overlay might not be properly configured in `/boot/firmware/config.txt`

## Changes Planned
- [ ] Check current `/boot/firmware/config.txt`
- [ ] Verify `dtoverlay=hifiberry-dac` is present
- [ ] Check kernel messages with dmesg
- [ ] Restart if needed

## Rollback Plan
1. git reset --hard [baseline-sha]
2. sudo git reset --hard [etckeeper-baseline-sha]
3. sudo reboot

---

## Pre-Execution Snapshots

### Git Branch
Created: git checkout -b timmo/debug-2026-02-22_194530-audio-fix

### Pre-Execution Git Snapshot
Baseline Commit: a1b2c3d4
Message: "baseline: before audio debug session"
Branch: timmo/debug-2026-02-22_194530-audio-fix

### Pre-Execution etckeeper Snapshot
Commit: e5f6g7h8
Message: "baseline: before audio debug session on 2026-02-22_194530"

---

## Execution Log

### Change 1: Check Device Configuration
**Timestamp**: 2026-02-22 19:46:00  
**Command**: cat /boot/firmware/config.txt | grep hifiberry  
**Result**: ✅ Found dtoverlay=hifiberry-dac  
**Output**:
```
dtoverlay=hifiberry-dac
```

### Verification after Change 1
- [x] Config file shows correct overlay
- [x] No errors in output

### Change 2: Check Kernel Messages
**Timestamp**: 2026-02-22 19:46:30  
**Command**: dmesg | grep -i hifi  
**Result**: ✅ Device detected  
**Output**:
```
[12.116070] snd_bcm2835_hifiberry_dac: HiFiBerry DAC detected
```

### Final Verification
```
aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: sndrpihifiberry [snd_rpi_hifiberry_dac], device 0: HifiBerry DAC HiFi pcm5102a-hifi-0
    Subdevices: 1/1
card 1: vc4hdmi [vc4-hdmi], device 0: MAI PCM i2s-hifi-0
    Subdevices: 1/1
```

---

## Summary

**Status**: ✅ Success

**Final Outcome**: Device is properly detected and working

**Commits**:
- Pre-execution: a1b2c3d4
- Post-execution: i9j0k1l2
- etckeeper pre: e5f6g7h8
- etckeeper post: m3n4o5p6

**Time Spent**: 19:45:30 → 19:50:15 (4m 45s)

**Next Steps**: 
1. Test audio playback to confirm full functionality
2. Create pull request if changes are good
3. Update system documentation

**Notes**: No config changes were needed—device was already correctly configured. Issue may be elsewhere.
```

---

## Workflow Constants

Keep these commands handy:

```bash
# Session date/time
SESSION_DATE=$(date +%Y-%m-%d_%H%M%S)

# Git branch name pattern
BRANCH_NAME="timmo/debug-${SESSION_DATE}-issue-title"

# Session file path
SESSION_FILE="~/logs/hifiberryng/debug_${SESSION_DATE}.md"

# Check git status
git status

# Check /etc changes
cd /etc && sudo git status

# View recent commits
git log --oneline -5

# Full verification
aplay -l && arecord -l && sudo journalctl -n 50 --no-pager
```

---

## Quick Reference Checklist

### Before Starting
- [ ] Create session plan with issue description
- [ ] Document expected outcome
- [ ] Git feature branch created
- [ ] Pre-execution git commit: `git commit -m "baseline: ..."`
- [ ] Pre-execution etckeeper commit: `sudo git commit -m "baseline: ..."`
- [ ] Session plan file ready for notes

### During Execution
- [ ] All commands logged: `script -af ...`
- [ ] Each change documented with timestamp
- [ ] Verify each change immediately after
- [ ] Update session file in real-time

### After Execution
- [ ] All changes tested and verified
- [ ] Git commit: `git commit -m "debug: ..."`
- [ ] etckeeper commit: `sudo git commit -m "debug: ..."`
- [ ] Both commit SHAs recorded in session file
- [ ] Session file finalized with summary
- [ ] Action log updated

### For Major Sessions
- [ ] Create pull request for code review
- [ ] Link session file in PR description
- [ ] Update `systematic_setup.md` if applicable
