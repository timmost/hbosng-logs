# HiFiBerry OS NG - Systematic Setup Guide

This guide provides a reproducible, fork-based development workflow for HiFiBerry OS with safe rollback capabilities at every step.

## Objectives

- **Windows 11 → VS Code → Raspberry Pi (Debian)** remote development workflow
- **Fork-based GitHub workflow** where every fix becomes installable "from scratch"
- **Safe rollback** on both the Pi system and in the codebase
- **AI-assisted development loop** with code visibility and optional terminal integration

---

## 0) Guiding Principles

### On the Pi (System Rollback)

- Clone the SD card image before doing anything risky (your "factory restore").
- Track config drift with etckeeper (Git for /etc) so you can revert config changes cleanly.
- Prefer idempotent installation steps (safe to re-run)

---

## 1) Raspberry Pi Baseline (Debian)

### On the Pi (System Rollback)

- Prefer idempotent installation steps (safe to re-run)

### In Git (Code Rollback)

- Work in small branches, commit early, commit often.
- Use `git revert` for "undo" (preserves history) instead of rewriting.
- Every successful step becomes documented and reproducible

---

### 1.1 Enable SSH + Stable Networking

**✅ Status**: SSH configured via Raspberry Pi Imager

- SSH is accessible via VS Code Remote SSH
- System packages updated with `sudo apt update` (22 Feb 2026)

**If needed later:**
```bash
sudo apt full-upgrade -y
sudo apt install -y git curl ca-certificates
```

**Recommended**: Reserve a DHCP lease in your router for a stable IP address.

### 1.2 Create a Full Rollback Point (SD Card Image)
Before making risky changes, create a byte-for-byte backup of your SD card on Windows using appropriate imaging tools. This is your last-resort recovery point.

### 1.3 Track /etc Changes with etckeeper

Git-based tracking for system configuration changes:

```bash
sudo apt install -y etckeeper
sudo etckeeper init
sudo etckeeper commit "baseline: fresh debian before hifiberryng"
```
2) Audio board sanity check (Beocreate / HiFiBerry overlay)
Even if hifiberryng later handles it, make sure your kernel sees the card.

2.1 Device tree overlay
HiFiBerry’s docs indicate Beocreate uses: dtoverlay=hifiberry-dac (hifiberry.com)

Depending on Debian image, the config is commonly one of:

/boot/config.txt
/boot/firmware/config.txt
Check:

ls -la /boot /boot/firmware 2>/dev/null
Edit the right config file:

sudo nano /boot/config.txt
# or:
sudo nano /boot/firmware/config.txt
Add (or ensure) these lines:

dtparam=audio=off
dtoverlay=hifiberry-dac
Reboot:

sudo reboot
Verify ALSA sees it:

✅ **Status**: HiFiBerry DAC (card 0) successfully detected and operational

Audio board sanity check completed (22 February 2026):

**ALSA output (aplay -l):**
```
**** List of PLAYBACK Hardware Devices ****
card 0: sndrpihifiberry [snd_rpi_hifiberry_dac]
  Device 0: HifiBerry DAC HiFi pcm5102a-hifi-0
card 1: vc4hdmi [vc4-hdmi]
  Device 0: MAI PCM i2s-hifi-0 (HDMI)
```

**ALSA Capture Devices:**
```
**** List of CAPTURE Hardware Devices ****
(None - expected for DAC-only setup)
```

#### Configuration Details

The HiFiBerry DAC uses the device tree overlay: `dtoverlay=hifiberry-dac`

This is configured in either:
- `/boot/config.txt` (older Debian)
- `/boot/firmware/config.txt` (Bookworm+)

**Current setup**: Properly configured and operational. No action needed.

---

## 3) GitHub Workflow — Fork + Remotes
### 3.1 Fork Upstream Repository

**✅ Status**: Fork exists at https://github.com/timmost/hifiberry-os

- Owner: timmost
- Upstream: hifiberry/hifiberry-os
- Tracking branch: hbosng

### 3.2 Clone Your Fork onto the Pi

**✅ Status**: Completed (22 February 2026)

**Setup commands:**
```bash
mkdir -p ~/src
cd ~/src
git clone --branch hbosng --single-branch https://github.com/timmost/hifiberry-os hbosng
cd hbosng
```

**Git configuration:**
```bash
git config --global user.email "timmo.sturm@gmail.com"
git config --global user.name "timmo"
```

**Fetch and configure upstream:**
```bash
git fetch --all --prune
git config remote.upstream.fetch "+refs/heads/hbosng:refs/remotes/upstream/hbosng"
git branch -dr upstream/master upstream/development
git fetch upstream
```

**Result**: Repository now tracks only the `hbosng` branch on both origin and upstream.

### 3.3 Branch Discipline (Small Steps, Easy Rollback)

**✅ Status**: Initial cleanup commit completed (22 February 2026)

**First commit:**
```
Commit: 735a7ed6
Message: "deleted TODO to reduce clutter"
Changes: Deleted 88 files (4308 lines) from packages/TODO/
```

**Future workflow:**
```bash
git checkout -b timmo/<feature-name>
# …make a small change…
git add -A
git commit -m "<clear description>"
git push -u origin timmo/<feature-name>
```
4) VS Code on Windows 11 — remote dev into the Pi
4.1 Install basics on Windows
Visual Studio Code
Git for Windows (so ssh, git, and credential helpers are sane)
4.2 VS Code Remote SSH
✅ **Status**: Already configured and working

SSH is already set up via raspi imager and VS Code connects directly to the Pi.
The Remote SSH extension connects seamlessly without manual key setup.

Usage:
- VS Code Remote SSH is already configured
- Open the workspace folder: `~/src/hifiberryng` on the Pi
- Terminal commands run directly on the Pi with full environment access
5) Add AI assistance in VS Code (safely)
You want the AI to help deploy and analyze system output. Two practical patterns:

Pattern A (lowest risk): AI suggests, you run commands
Use Copilot Chat / Continue for code + reasoning
You manually run commands and paste output into the chat when needed
Pattern B (more automated): agent can run commands and read terminal output
Tools like Cline can execute commands in the VS Code terminal and read back results (enabled by VS Code shell integration). (GitHub) VS Code also has “agent mode” capabilities (depending on your setup/version). (Visual Studio Code)

Safety defaults if you try Pattern B:

Do not auto-approve destructive commands.
Add a “guardrail” checklist to every run: no rm -rf /, no disk tools, no repartitioning, no curl | sh unless reviewed.
(There have been real-world incidents of harmful prompts in coding assistants; treat terminal-execution agents like you’d treat sudo.) (Tom's Hardware)

6) Pi-side “developer cockpit” (repeatable diagnostics + logs)
Install a standard toolset:

sudo apt install -y \
  build-essential pkg-config \
  python3 python3-venv python3-pip \
  nodejs npm \
  jq ripgrep tmux \
  shellcheck \
  git
Create a logging folder:

mkdir -p ~/logs/hifiberryng
Run sessions in tmux (so you don’t lose state):

tmux new -s hifiberryng
Useful live views:

# Terminal 1: system logs
sudo journalctl -f

# Terminal 2: kernel messages
sudo dmesg -w

# Terminal 3: your install/run commands (logged)
script -af ~/logs/hifiberryng/session_$(date +%F_%H%M).log
Now, whenever you do something, you have a file you (or an AI tool) can analyze.

7) Deploy hifiberryng stepwise (the repeatable loop)
### 7.1 Modernize Debian Compatibility

**Common breakages on "older Debian assumptions":**

wrong paths (/boot/firmware vs /boot)
deprecated networking expectations
systemd unit differences
missing packages / renamed packages
Make a new branch per issue:

cd ~/src/hifiberryng
git checkout -b timmo/debian-modernize-01
7.2 Run installer with maximum transparency
Never run blind. Prefer:

bash -euxo pipefail ./install.sh 2>&1 | tee ~/logs/hifiberryng/install_$(date +%F_%H%M).log
If it’s make install / npm install / etc., do the same tee logging.

7.3 Convert fixes into “install-from-scratch” assets
As you find missing prerequisites, don’t just install them manually—encode them:

docs/INSTALL-debian.md
scripts/preflight.sh (checks OS version, paths, required packages)
scripts/install_debian.sh (idempotent, re-runnable)
systemd/*.service units checked into repo
Makefile targets: make preflight, make install, make uninstall
Commit each milestone:

git add -A
git commit -m "debian: add preflight checks and package install list"
git push -u origin timmo/debian-modernize-01
8) Reversal / rollback playbook (system + code)
8.1 Undo code changes
Undo a commit safely:
git revert <commit-sha>
Throw away local uncommitted changes:
git restore .
git clean -fd
8.2 Undo /etc config changes (etckeeper)
cd /etc
sudo git status
sudo git diff
sudo git log --oneline --max-count=20

# revert a specific file
sudo git checkout -- somefile.conf

# or revert everything tracked by etckeeper
sudo git reset --hard
8.3 Undo packages installed during a path
Use apt history to identify packages; then:

sudo apt remove --purge <pkg1> <pkg2>
sudo apt autoremove --purge -y
8.4 Nuclear option
Re-flash the SD card from your backup image (you’re back to baseline in minutes).

9) Make the repo “installable on a new machine” (definition of done)
When you reach a working state, lock it in:

One command install (documented):

./scripts/install_debian.sh
One command verify:

./scripts/verify.sh (checks services, audio devices, ports, UI)
One command uninstall (optional but valuable):

./scripts/uninstall.sh
CI checks on GitHub:

shellcheck on all scripts
lint/unit tests if applicable
Changelog entries per fix

(As an example of a core dependency in the HiFiBerry ecosystem, audiocontrol2 lists required libs like libasound2-dev and libglib2.0-dev—the kind of thing that belongs in your preflight/install list.) (GitHub)

What I need from you to tailor the next steps (without slowing you down)
If you paste just these two things, I can turn the generic loop above into an exact plan for your repo:

the upstream repo URL (or git remote -v output)
the first failing installer run log (~/logs/...install_*.log)
Then I’ll respond with:

the exact package list for Debian on Pi 3B
the specific script modernizations (paths, systemd, config placement)
a clean branch-by-branch migration plan (with rollback points)