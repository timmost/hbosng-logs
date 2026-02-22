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
- `INSTRUCTIONS/AI_DEBUGGING_WORKFLOW.md` - Safe debugging with rollback (includes Phase 6: Contributing Sessions)
- `INSTRUCTIONS/LOGS_REPO_SETUP.md` - This repository's administration guide
- `CONTRIBUTING.md` - **How to contribute completed debug sessions**
- `INDEX.md` - Searchable index of all sessions and findings

## Quick Links

- View all sessions: `INDEX.md`
- Latest session: See SESSIONS/ directory, sorted by date
- System state: EXPORTS/etckeeper_snapshots/
- **Contributing guide**: `CONTRIBUTING.md`

## Contributing Sessions

When completing a debug session, follow `CONTRIBUTING.md` for detailed instructions:

```bash
# Quick summary:
1. Use ~/src/hbosng-logs/import_session.sh ~/logs/hifiberryng/debug_*.md
2. Export etckeeper snapshot (if /etc was modified)
3. Export action log to EXPORTS/action_logs/
4. Update INDEX.md with session summary
5. Push to GitHub: git push origin main
```

**See `CONTRIBUTING.md` for complete step-by-step guide with examples.**

## Repository Facts

- **Created**: 22 February 2026
- **Owner**: timmost
- **Purpose**: Maintain audit trail of HiFiBerry OS NG development
- **Storage**: Alongside primary hbosng repository at ~/src/hbosng-logs/

---

For complete setup instructions, see `INSTRUCTIONS/LOGS_REPO_SETUP.md`
