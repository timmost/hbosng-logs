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
- Planning & documentation phase (Phase 1-2)
- Pre-execution snapshots (Phase 3: git + etckeeper)
- Execution with full logging (Phase 4)
- Post-execution verification
- **Contributing sessions to logs repo (Phase 6)** ⭐
- Emergency rollback procedures
- Example session templates

**When to use**: Before starting any debugging work, use as SOP. Includes session contribution steps.

### LOGS_REPO_SETUP.md
This repository's administration guide:
- Repository structure and purpose
- Adding new sessions
- Exporting system snapshots
- Maintaining the index

**When to use**: Setting up the logs repo, adding new debug sessions

### CONTRIBUTING.md
*(Located in repository root, not INSTRUCTIONS/)*

Detailed guide for contributing completed debug sessions:
- Step-by-step import process
- etckeeper snapshot export
- Action log archival
- Updating the session index
- GitHub push procedures
- Complete checklist
- Examples and troubleshooting

**When to use**: After completing a debug session using AI_DEBUGGING_WORKFLOW.md. This ensures every session is properly archived with full audit trail.

---

All three documents work together to provide:
1. **Initial Setup** (systematic_setup.md) → Configure system
2. **Safe Debugging** (AI_debugging_workflow.md) → Execute changes safely
3. **Log Management** (logs_repo_setup.md) → Archive and track everything

## Workflow Sequence

These documents are used in order:

1. **Before First Debug**  
   Read `systematic_setup.md` for baseline configuration

2. **When Debugging**  
   Follow `AI_DEBUGGING_WORKFLOW.md` (6 phases including session contribution)

3. **After Session**  
   Use `CONTRIBUTING.md` for step-by-step archival process

4. **Repository Maintenance**  
   Reference `LOGS_REPO_SETUP.md` for admin tasks

**Key Point**: AI_DEBUGGING_WORKFLOW.md Phase 6 directs you to CONTRIBUTING.md for the final step of archiving your work to the logs repository.
