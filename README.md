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
- `INSTRUCTIONS/LOGS_REPO_SETUP.md` - This repository's administration guide
- `INDEX.md` - Searchable index of all sessions and findings

## Quick Links

- View all sessions: `INDEX.md`
- Latest session: See SESSIONS/ directory, sorted by date
- System state: EXPORTS/etckeeper_snapshots/

## Contributing Sessions

When completing a debug session:
1. Copy session file: `cp ~/logs/hifiberryng/debug_*.md SESSIONS/`
2. Export etckeeper snapshot: See INSTRUCTIONS/LOGS_REPO_SETUP.md
3. Update INDEX.md with session summary
4. Commit: `git add -A && git commit -m "session: [description]"`

## Repository Facts

- **Created**: 22 February 2026
- **Owner**: timmost
- **Purpose**: Maintain audit trail of HiFiBerry OS NG development
- **Storage**: Alongside primary hbosng repository at ~/src/hbosng-logs/

---

For complete setup instructions, see `INSTRUCTIONS/LOGS_REPO_SETUP.md`
