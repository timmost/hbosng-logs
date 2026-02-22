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

---

All three documents work together to provide:
1. **Initial Setup** (systematic_setup.md) → Configure system
2. **Safe Debugging** (AI_debugging_workflow.md) → Execute changes safely
3. **Log Management** (logs_repo_setup.md) → Archive and track everything
