# Action Log

## Terminal Actions

### Command: `sudo apt update`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo
- **Exit Code**: 0 (Success)
- **Terminal**: sudo
- **Purpose**: Update system package lists

### Command: `aplay -l`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo
- **Purpose**: Verify HiFiBerry DAC audio hardware detection
- **Result**: ✅ HiFiBerry DAC (card 0) detected successfully
```
**** List of PLAYBACK Hardware Devices ****
card 0: sndrpihifiberry [snd_rpi_hifiberry_dac], device 0: HifiBerry DAC HiFi pcm5102a-hifi-0
card 1: vc4hdmi [vc4-hdmi], device 0: MAI PCM i2s-hifi-0
```

### Command: `arecord -l`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo
- **Purpose**: Check for capture devices
- **Result**: No capture devices (expected for DAC-only setup)

### Command: `dmesg | tail -n 200`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo
- **Purpose**: Verify kernel initialization and hardware detection
- **Result**: ✅ System logs confirm successful initialization

### Command: `mkdir -p ~/src`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo
- **Purpose**: Create source code directory
- **Result**: ✅ Success

### Command: `git clone --branch hbosng --single-branch https://github.com/timmost/hifiberry-os hbosng`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo/src
- **Purpose**: Clone hifiberry-os repository, hbosng branch only
- **Result**: ✅ Cloned 17431 objects, 49.68 MiB

### Command: `git config --global user.email "timmo.sturm@gmail.com" && git config --global user.name "timmo"`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo/src/hbosng
- **Purpose**: Configure git identity
- **Result**: ✅ Global git config set

### Command: `git add . && git commit -m "deleted TODO to reduce clutter"`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo/src/hbosng/packages
- **Purpose**: Remove legacy TODO folder from repository
- **Result**: ✅ Commit 735a7ed6
  - Files deleted: 88
  - Lines removed: 4308

### Command: `git push origin hbosng`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo/src/hbosng
- **Purpose**: Push cleanup commit to fork
- **Result**: ✅ Pushed to https://github.com/timmost/hifiberry-os (hbosng branch)

### Command: `git fetch upstream`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo/src/hbosng
- **Exit Code**: 0 (Success)
- **Purpose**: Fetch latest updates from upstream repository
- **Result**: ✅ Fetched 3 branches (master, hbosng, development)

### Command: `git config remote.upstream.fetch "+refs/heads/hbosng:refs/remotes/upstream/hbosng"`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo/src/hbosng
- **Purpose**: Configure upstream to fetch only hbosng branch
- **Result**: ✅ Remote tracking configured

### Command: `git branch -dr upstream/master upstream/development`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo/src/hbosng
- **Purpose**: Clean up unnecessary remote tracking branches
- **Result**: ✅ Deleted remote-tracking branches

### File Created: AI_DEBUGGING_WORKFLOW.md
- **Created**: 22 February 2026
- **Purpose**: Comprehensive workflow for AI-supported debugging with full rollback capability
- **Location**: /home/timmo/AI_DEBUGGING_WORKFLOW.md
- **Key Features**: Planning phase, pre-execution snapshots, execution logging, post-execution commits, emergency rollback procedures

---

### File Created: LOGS_REPO_SETUP.md
- **Created**: 22 February 2026
- **Purpose**: Instructions for creating and administering separate logs repository for debug sessions and system snapshots
- **Location**: /home/timmo/LOGS_REPO_SETUP.md
- **Key Features**: Step-by-step setup instructions for hbosng-logs repository infrastructure

### Executed: LOGS_REPO_SETUP.md instructions (Steps 1-7)
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo/src/hbosng-logs
- **Purpose**: Initialize logs repository with complete structure and documentation
- **Result**: ✅ Success
- **Commands Executed**:
  1. Directory structure created (INSTRUCTIONS, SESSIONS, EXPORTS subdirectories)
  2. README.md created (550 lines, documents repository purpose and structure)
  3. .gitignore created (excludes OS files, credentials, large files, temp data)
  4. Instructions copied to INSTRUCTIONS/ subdirectory (3 markdown files):
     - systematic_setup.md
     - AI_DEBUGGING_WORKFLOW.md
     - LOGS_REPO_SETUP.md
  5. INSTRUCTIONS/README.md created (guide to three workspace documents)
  6. INDEX.md created (master session index with searchable categories)
  7. import_session.sh created (helper script with execute permissions)
  8. Initial git commit created (commit 7f30c414)

- **Files Created**: 8 files
- **Lines Inserted**: 1759 lines
- **Commit**: 7f30c414 "initial: create hbosng-logs repository with instructions and structure"

### File Created: LOGS_README.md (in hbosng repository)
- **Created**: 22 February 2026
- **Location**: /home/timmo/src/hbosng/LOGS_README.md
- **Purpose**: Reference guide linking hbosng repository to companion logs repository
- **Size**: 2023 bytes
- **Content**: Explains logs repository structure, quick links, and usage patterns

### Command: `git add LOGS_README.md && git commit -m "docs: add reference to logs repository"`
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo/src/hbosng
- **Purpose**: Commit pointer to logs repository in main hbosng repository
- **Result**: ✅ Commit 319f3681
- **Details**: 
  - Added LOGS_README.md to hbosng repository
  - Created reference back to companion logs repository
  - Enables easy navigation from main codebase to logs and instructions

### File Updated: AI_DEBUGGING_WORKFLOW.md (Phase 6 added)
- **Updated**: 22 February 2026
- **Purpose**: Added Phase 6 - Contribute to Logs Repository
- **Content**: Complete instructions for importing sessions, exporting snapshots, updating index, and pushing to GitHub
- **Location**: /home/timmo/src/hbosng-logs/INSTRUCTIONS/AI_DEBUGGING_WORKFLOW.md

### File Created: CONTRIBUTING.md
- **Created**: 22 February 2026
- **Purpose**: Formal contributing guide for debug sessions with detailed steps, examples, and troubleshooting
- **Location**: /home/timmo/src/hbosng-logs/CONTRIBUTING.md
- **Size**: 341 lines, covers quick-start through complete checklist
- **Key Sections**: Import, etckeeper export, action log export, index update, GitHub push, checklists, examples

### Command: Updated documentation files and committed to logs repository
- **Executed**: 22 February 2026
- **Working Directory**: /home/timmo/src/hbosng-logs
- **Files Updated**: 3
  - CONTRIBUTING.md (new file, 341 lines)
  - README.md (updated to reference CONTRIBUTING.md)
  - INSTRUCTIONS/README.md (added CONTRIBUTING.md documentation)
- **Commits Created**:
  - 32ef328b "docs: add CONTRIBUTING.md and session contribution workflow (Phase 6)"
- **Key Achievement**: Formal contributing workflow now integrated with AI_DEBUGGING_WORKFLOW.md

## Summary
- Total actions recorded: 20
- Successful executions: 20
- Status: ✅ Complete logs repository infrastructure with formal contributing workflow
- Logs Repository: /home/timmo/src/hbosng-logs/ (commit 32ef328b - contributing workflow added)
- Main Repository: /home/timmo/src/hbosng/ (commit 319f3681 - logs reference added)
- Current branch: hbosng (hifiberry-os fork)
- Key achievements:
  - ✅ Full audit trail and debug session infrastructure operational
  - ✅ Phase 6 contributing workflow documented in AI_DEBUGGING_WORKFLOW.md
  - ✅ CONTRIBUTING.md formal guide with step-by-step instructions
  - ✅ All documentation linked and cross-referenced


timmo@hifiberryng:~ $ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: sndrpihifiberry [snd_rpi_hifiberry_dac], device 0: HifiBerry DAC HiFi pcm5102a-hifi-0 [HifiBerry DAC HiFi pcm5102a-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: vc4hdmi [vc4-hdmi], device 0: MAI PCM i2s-hifi-0 [MAI PCM i2s-hifi-0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
timmo@hifiberryng:~ $ arecord -l
**** List of CAPTURE Hardware Devices ****
timmo@hifiberryng:~ $ dmesg | tail -n 200
[    3.390274] Indeed it is in host mode hprt0 = 00001101
[    3.518683] mmc0: host does not support reading read-only switch, assuming write-enable
[    3.533800] mmc0: new high speed SDHC card at address aaaa
[    3.541234] mmcblk0: mmc0:aaaa SC32G 29.7 GiB
[    3.553388]  mmcblk0: p1 p2
[    3.558028] mmcblk0: mmc0:aaaa SC32G 29.7 GiB (quirks 0x0000c000)
[    3.589291] usb 1-1: New USB device found, idVendor=0424, idProduct=2514, bcdDevice= b.b3
[    3.601823] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    3.613690] hub 1-1:1.0: USB hub found
[    3.619589] hub 1-1:1.0: 4 ports detected
[    3.904858] usb 1-1.1: new high-speed USB device number 3 using dwc_otg
[    4.005164] usb 1-1.1: New USB device found, idVendor=0424, idProduct=2514, bcdDevice= b.b3
[    4.015667] usb 1-1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    4.026368] hub 1-1.1:1.0: USB hub found
[    4.031634] hub 1-1.1:1.0: 3 ports detected
[    4.389833] dwc_otg_handle_wakeup_detected_intr lxstate = 2
[    4.436354] EXT4-fs (mmcblk0p2): orphan cleanup on readonly fs
[    4.443938] EXT4-fs (mmcblk0p2): mounted filesystem 21724cc6-e5a3-48a1-8643-7917dba3a9fb ro with ordered data mode. Quota mode: none.
[    4.856836] usb 1-1.1.1: new high-speed USB device number 4 using dwc_otg
[    4.953114] usb 1-1.1.1: New USB device found, idVendor=0424, idProduct=7800, bcdDevice= 3.00
[    4.963568] usb 1-1.1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    5.218999] systemd[1]: System time advanced to timestamp on /var/lib/systemd/timesync/clock: Sun 2026-02-22 19:24:14 CET
[    5.235357] lan78xx 1-1.1.1:1.0 (unnamed net_device) (uninitialized): No External EEPROM. Setting MAC Speed
[    5.354942] lan78xx 1-1.1.1:1.0 (unnamed net_device) (uninitialized): int urb period 64
[    5.447394] NET: Registered PF_INET6 protocol family
[    5.454522] Segment Routing with IPv6
[    5.459312] In-situ OAM (IOAM) with IPv6
[    5.553275] systemd[1]: systemd 257.9-1~deb13u1 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
[    5.592902] systemd[1]: Detected architecture arm64.
[    5.631281] systemd[1]: Hostname set to <hifiberryng>.
[    6.003557] systemd[1]: bpf-restrict-fs: BPF LSM hook not enabled in the kernel, BPF LSM not supported.
[    6.015622] systemd[1]: Using hardware watchdog 'Broadcom BCM2835 Watchdog timer', version 0, device /dev/watchdog0
[    6.028540] systemd[1]: Watchdog running with a hardware timeout of 1min.
[    6.257135] zram_generator::config[199]: zram0: system has too much memory (905MB), limit is 0MB, ignoring.
[    7.889207] systemd[1]: Queued start job for default target multi-user.target.
[    7.940625] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[    7.952014] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[    7.963835] systemd[1]: Created slice system-rpi\x2dsetup\x2dloop.slice - Slice /system/rpi-setup-loop.
[    7.978212] systemd[1]: Created slice system-serial\x2dgetty.slice - Slice /system/serial-getty.
[    7.991966] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[    8.005839] systemd[1]: Created slice system-systemd\x2dzram\x2dsetup.slice - Slice /system/systemd-zram-setup.
[    8.020522] systemd[1]: Created slice user.slice - User and Session Slice.
[    8.030387] systemd[1]: Started systemd-ask-password-console.path - Dispatch Password Requests to Console Directory Watch.
[    8.045447] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[    8.060362] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[    8.077006] systemd[1]: Expecting device dev-disk-by\x2dpartuuid-f300ec7e\x2d01.device - /dev/disk/by-partuuid/f300ec7e-01...
[    8.092207] systemd[1]: Expecting device dev-ttyS0.device - /dev/ttyS0...
[    8.101634] systemd[1]: Expecting device dev-zram0.device - /dev/zram0...
[    8.111156] systemd[1]: Reached target paths.target - Path Units.
[    8.119875] systemd[1]: Reached target remote-fs.target - Remote File Systems.
[    8.129687] systemd[1]: Reached target slices.target - Slice Units.
[    8.145004] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
[    8.157704] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[    8.170598] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[    8.183695] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
[    8.193873] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    8.210088] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    8.226408] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[    8.238518] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    8.249591] systemd[1]: dev-hugepages.mount - Huge Pages File System was skipped because of an unmet condition check (ConditionPathExists=/sys/kernel/mm/hugepages).
[    8.272690] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[    8.287619] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
[    8.302360] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[    8.321313] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[    8.351377] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
[    8.371744] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[    8.389472] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[    8.407175] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[    8.426441] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
[    8.445695] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[    8.457429] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
[    8.457599] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    8.518180] systemd[1]: Starting systemd-journald.service - Journal Service...
[    8.549576] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[    8.560936] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    8.585769] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[    8.599704] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    8.600771] fuse: init (API version 7.41)
[    8.625943] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
[    8.645354] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[    8.668734] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue File System.
[    8.683680] systemd[1]: Mounted run-lock.mount - Legacy Locks Directory /run/lock.
[    8.707659] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug File System.
[    8.719703] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[    8.732490] systemd[1]: Finished kmod-static-nodes.service - Create List of Static Device Nodes.
[    8.745702] EXT4-fs (mmcblk0p2): re-mounted 21724cc6-e5a3-48a1-8643-7917dba3a9fb r/w.
[    8.761176] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[    8.770745] systemd[1]: Finished modprobe@configfs.service - Load Kernel Module configfs.
[    8.773377] zram: Added device: zram0
[    8.789904] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    8.798961] systemd[1]: Finished modprobe@drm.service - Load Kernel Module drm.
[    8.810681] systemd[1]: modprobe@efi_pstore.service: Deactivated successfully.
[    8.820170] systemd[1]: Finished modprobe@efi_pstore.service - Load Kernel Module efi_pstore.
[    8.834385] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    8.835051] systemd-journald[279]: Collecting audit messages is disabled.
[    8.836403] systemd[1]: Finished modprobe@fuse.service - Load Kernel Module fuse.
[    8.862203] systemd[1]: Finished systemd-modules-load.service - Load Kernel Modules.
[    8.874011] systemd[1]: Finished systemd-remount-fs.service - Remount Root and Kernel File Systems.
[    8.887945] systemd[1]: Started systemd-journald.service - Journal Service.
[    9.205906] systemd-journald[279]: Received client request to flush runtime journal.
[    9.768353] loop0: detected capacity change from 0 to 1853440
[   10.181749] zram: setup backing device /dev/disk/by-backingfile/var-swap
[   10.196344] zram0: detected capacity change from 0 to 1853440
[   10.593815] Adding 926716k swap on /dev/zram0.  Priority:100 extents:1 across:926716k SS
[   10.843578] rpi-gpiomem 3f200000.gpiomem: window base 0x3f200000 size 0x00001000
[   10.844370] rpi-gpiomem 3f200000.gpiomem: initialised 1 regions as /dev/gpiomem
[   10.895045] snd_bcm2835: module is from the staging directory, the quality is unknown, you have been warned.
[   10.899208] mc: Linux media interface: v0.10
[   11.016465] videodev: Linux video capture interface: v2.00
[   11.090146] vc_sm_cma: module is from the staging directory, the quality is unknown, you have been warned.
[   11.096514] bcm2835_vc_sm_cma_probe: Videocore shared memory driver
[   11.096549] [vc_sm_connected_init]: start
[   11.097739] [vc_sm_connected_init]: installed successfully
[   11.117513] bcm2835_mmal_vchiq: module is from the staging directory, the quality is unknown, you have been warned.
[   11.125557] Bluetooth: Core ver 2.22
[   11.125707] NET: Registered PF_BLUETOOTH protocol family
[   11.125716] Bluetooth: HCI device and connection manager initialized
[   11.125742] Bluetooth: HCI socket layer initialized
[   11.125754] Bluetooth: L2CAP socket layer initialized
[   11.125784] Bluetooth: SCO socket layer initialized
[   11.160048] bcm2835_codec: module is from the staging directory, the quality is unknown, you have been warned.
[   11.164118] bcm2835_isp: module is from the staging directory, the quality is unknown, you have been warned.
[   11.169390] bcm2835_v4l2: module is from the staging directory, the quality is unknown, you have been warned.
[   11.178429] bcm2835-isp bcm2835-isp: Device node output[0] registered as /dev/video13
[   11.179321] bcm2835-isp bcm2835-isp: Device node capture[0] registered as /dev/video14
[   11.180264] bcm2835-isp bcm2835-isp: Device node capture[1] registered as /dev/video15
[   11.188682] bcm2835-isp bcm2835-isp: Device node stats[2] registered as /dev/video16
[   11.188719] bcm2835-isp bcm2835-isp: Register output node 0 with media controller
[   11.188734] bcm2835-isp bcm2835-isp: Register capture node 1 with media controller
[   11.188745] bcm2835-isp bcm2835-isp: Register capture node 2 with media controller
[   11.188756] bcm2835-isp bcm2835-isp: Register capture node 3 with media controller
[   11.190008] bcm2835-codec bcm2835-codec: Device registered as /dev/video10
[   11.190062] bcm2835-codec bcm2835-codec: Loaded V4L2 decode
[   11.197621] Bluetooth: HCI UART driver ver 2.3
[   11.197655] Bluetooth: HCI UART protocol H4 registered
[   11.197781] Bluetooth: HCI UART protocol Three-wire (H5) registered
[   11.199208] hci_uart_bcm serial0-0: supply vbat not found, using dummy regulator
[   11.199438] hci_uart_bcm serial0-0: supply vddio not found, using dummy regulator
[   11.199697] Bluetooth: HCI UART protocol Broadcom registered
[   11.200761] bcm2835-codec bcm2835-codec: Device registered as /dev/video11
[   11.200868] bcm2835-codec bcm2835-codec: Loaded V4L2 encode
[   11.207736] bcm2835-isp bcm2835-isp: Device node output[0] registered as /dev/video20
[   11.213281] bcm2835-isp bcm2835-isp: Device node capture[0] registered as /dev/video21
[   11.214108] bcm2835-codec bcm2835-codec: Device registered as /dev/video12
[   11.214163] bcm2835-codec bcm2835-codec: Loaded V4L2 isp
[   11.216120] bcm2835-isp bcm2835-isp: Device node capture[1] registered as /dev/video22
[   11.216693] bcm2835-isp bcm2835-isp: Device node stats[2] registered as /dev/video23
[   11.216743] bcm2835-isp bcm2835-isp: Register output node 0 with media controller
[   11.216761] bcm2835-isp bcm2835-isp: Register capture node 1 with media controller
[   11.216775] bcm2835-isp bcm2835-isp: Register capture node 2 with media controller
[   11.216853] bcm2835-isp bcm2835-isp: Register capture node 3 with media controller
[   11.217520] bcm2835-isp bcm2835-isp: Loaded V4L2 bcm2835-isp
[   11.218612] bcm2835-codec bcm2835-codec: Device registered as /dev/video18
[   11.218658] bcm2835-codec bcm2835-codec: Loaded V4L2 image_fx
[   11.224638] bcm2835-codec bcm2835-codec: Device registered as /dev/video31
[   11.224689] bcm2835-codec bcm2835-codec: Loaded V4L2 encode_image
[   11.277681] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   11.301957] Loaded X.509 cert 'benh@debian.org: 577e021cb980e0e820821ba7b54b4961b8b4fadf'
[   11.302801] Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
[   11.303543] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   11.304264] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[   11.554129] Bluetooth: hci0: BCM: chip id 107
[   11.557470] Bluetooth: hci0: BCM: features 0x2f
[   11.559295] Bluetooth: hci0: BCM4345C0
[   11.559333] Bluetooth: hci0: BCM4345C0 (003.001.025) build 0000
[   11.566205] Bluetooth: hci0: BCM4345C0 'brcm/BCM4345C0.raspberrypi,3-model-b-plus.hcd' Patch
[   11.621280] brcmfmac: F1 signature read @0x18000000=0x15264345
[   11.627038] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43455-sdio for chip BCM4345/6
[   11.635668] usbcore: registered new interface driver brcmfmac
[   11.976628] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob available (err=-2)
[   11.977271] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0: Aug 29 2023 01:47:08 version 7.45.265 (28bca26 CY) FWID 01-b677b91b
[   12.046896] Console: switching to colour dummy device 80x25
[   12.051684] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
[   12.062642] Registered IR keymap rc-cec
[   12.062857] rc rc0: vc4-hdmi as /devices/platform/soc/3f902000.hdmi/rc/rc0
[   12.063923] input: vc4-hdmi as /devices/platform/soc/3f902000.hdmi/rc/rc0/input0
[   12.115404] input: vc4-hdmi HDMI Jack as /devices/platform/soc/3f902000.hdmi/sound/card1/input1
[   12.132633] vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
[   12.133288] vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
[   12.133567] vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops [vc4])
[   12.133793] vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops [vc4])
[   12.133978] vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops [vc4])
[   12.134142] vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
[   12.188080] [drm] Initialized vc4 0.0.0 for soc:gpu on minor 0
[   12.189140] vc4-drm soc:gpu: [drm] Cannot find any crtc or sizes
[   12.191422] vc4-drm soc:gpu: [drm] Cannot find any crtc or sizes
[   12.425696] Bluetooth: hci0: BCM: features 0x2f
[   12.427108] Bluetooth: hci0: BCM43455 37.4MHz Raspberry Pi 3+-0190
[   12.427134] Bluetooth: hci0: BCM4345C0 (003.001.025) build 0382
[   12.427494] Bluetooth: hci0: BCM: Using default device address (43:45:c0:00:1f:ac)
[   16.270119] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   16.270143] Bluetooth: BNEP filters: protocol multicast
[   16.270163] Bluetooth: BNEP socket layer initialized
[   16.279945] Bluetooth: MGMT ver 1.23
[   16.309446] NET: Registered PF_ALG protocol family
[   16.705726] Bluetooth: RFCOMM TTY layer initialized
[   16.705779] Bluetooth: RFCOMM socket layer initialized
[   16.705808] Bluetooth: RFCOMM ver 1.11
[   28.580211] lan78xx 1-1.1.1:1.0 eth0: Link is Up - 1Gbps/Full - flow control rx/tx
[   28.618841] brcmfmac: brcmf_cfg80211_set_power_mgmt: power save enabled
timmo@hifiberryng:~ $ sudo journalctl -b --no-pager | tail -n 200
Feb 22 19:24:35 hifiberryng systemd[1]: Reloading finished in 1495 ms.
Feb 22 19:24:36 hifiberryng generate[886]: Permissions for /lib/netplan/00-network-manager-all.yaml are too open. Netplan configuration should NOT be accessible by others.
Feb 22 19:24:36 hifiberryng systemd[1]: Reload requested from client PID 889 ('systemctl') (unit NetworkManager.service)...
Feb 22 19:24:36 hifiberryng systemd[1]: Reloading...
Feb 22 19:24:37 hifiberryng systemd[1]: Reloading finished in 1483 ms.
Feb 22 19:24:37 hifiberryng systemd[1]: NetworkManager-dispatcher.service: Deactivated successfully.
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1121] dhcp: init: Using DHCP client 'internal'
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1132] manager: (lo): new Loopback device (/org/freedesktop/NetworkManager/Devices/1)
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1180] device (lo): state change: unmanaged -> unavailable (reason 'connection-assumed', managed-type: 'external')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1199] device (lo): state change: unavailable -> disconnected (reason 'connection-assumed', managed-type: 'external')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1229] device (lo): Activation: starting connection 'lo' (6d36e44a-3872-43ed-b829-c3306c3301e8)
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1271] manager: (eth0): new Ethernet device (/org/freedesktop/NetworkManager/Devices/2)
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1283] device (eth0): state change: unmanaged -> unavailable (reason 'managed', managed-type: 'external')
Feb 22 19:24:38 hifiberryng kernel: lan78xx 1-1.1.1:1.0 eth0: Link is Up - 1Gbps/Full - flow control rx/tx
Feb 22 19:24:38 hifiberryng dbus-daemon[539]: [system] Activating via systemd: service name='org.freedesktop.nm_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service' requested by ':1.9' (uid=0 pid=567 comm="/usr/sbin/NetworkManager --no-daemon")
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1512] device (wlan0): driver supports Access Point (AP) mode
Feb 22 19:24:38 hifiberryng systemd[1]: Starting NetworkManager-dispatcher.service - Network Manager Script Dispatcher Service...
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1586] manager: (wlan0): new 802.11 Wi-Fi device (/org/freedesktop/NetworkManager/Devices/3)
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1601] device (wlan0): state change: unmanaged -> unavailable (reason 'managed', managed-type: 'external')
Feb 22 19:24:38 hifiberryng kernel: brcmfmac: brcmf_cfg80211_set_power_mgmt: power save enabled
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1852] failed to open /run/network/ifstate
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.1879] bus-manager: acquired D-Bus service "org.freedesktop.NetworkManager"
Feb 22 19:24:38 hifiberryng systemd[1]: Started NetworkManager.service - Network Manager.
Feb 22 19:24:38 hifiberryng systemd[1]: Reached target network.target - Network.
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2069] device (lo): state change: disconnected -> prepare (reason 'none', managed-type: 'external')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2078] device (lo): state change: prepare -> config (reason 'none', managed-type: 'external')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2085] device (lo): state change: config -> ip-config (reason 'none', managed-type: 'external')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2108] device (eth0): carrier: link connected
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2135] modem-manager: oFono is not available
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2139] device (lo): state change: ip-config -> ip-check (reason 'none', managed-type: 'external')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2162] device (eth0): state change: unavailable -> disconnected (reason 'carrier-changed', managed-type: 'full')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2219] policy: auto-activating connection 'netplan-eth0' (75a1216a-9d1a-30cd-8aca-ace5526ec021)
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2251] modem-manager: ModemManager available
Feb 22 19:24:38 hifiberryng systemd[1]: Starting NetworkManager-wait-online.service - Network Manager Wait Online...
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2288] device (eth0): Activation: starting connection 'netplan-eth0' (75a1216a-9d1a-30cd-8aca-ace5526ec021)
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2303] device (eth0): state change: disconnected -> prepare (reason 'none', managed-type: 'full')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2328] manager: NetworkManager state is now CONNECTING
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2348] device (eth0): state change: prepare -> config (reason 'none', managed-type: 'full')
Feb 22 19:24:38 hifiberryng systemd[1]: Starting ssh.service - OpenBSD Secure Shell server...
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2486] device (eth0): state change: config -> ip-config (reason 'none', managed-type: 'full')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2525] dhcp4 (eth0): activation: beginning transaction (timeout in 45 seconds)
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.2669] dhcp4 (eth0): state changed new lease, address=192.168.178.64, acd pending
Feb 22 19:24:38 hifiberryng avahi-daemon[536]: Joining mDNS multicast group on interface eth0.IPv6 with address fe80::ba27:ebff:fe41:5440.
Feb 22 19:24:38 hifiberryng avahi-daemon[536]: New relevant interface eth0.IPv6 for mDNS.
Feb 22 19:24:38 hifiberryng avahi-daemon[536]: Registering new address record for fe80::ba27:ebff:fe41:5440 on eth0.*.
Feb 22 19:24:38 hifiberryng systemd[1]: Starting systemd-user-sessions.service - Permit User Sessions...
Feb 22 19:24:38 hifiberryng dbus-daemon[539]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
Feb 22 19:24:38 hifiberryng systemd[1]: Started NetworkManager-dispatcher.service - Network Manager Script Dispatcher Service.
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.3184] device (lo): state change: ip-check -> secondaries (reason 'none', managed-type: 'external')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.3195] device (lo): state change: secondaries -> activated (reason 'none', managed-type: 'external')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.3238] device (lo): Activation: successful, device activated.
Feb 22 19:24:38 hifiberryng systemd[1]: Finished systemd-user-sessions.service - Permit User Sessions.
Feb 22 19:24:38 hifiberryng systemd[1]: Started getty@tty1.service - Getty on tty1.
Feb 22 19:24:38 hifiberryng systemd[1]: Started serial-getty@ttyS0.service - Serial Getty on ttyS0.
Feb 22 19:24:38 hifiberryng systemd[1]: Reached target getty.target - Login Prompts.
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.4353] dhcp4 (eth0): state changed new lease, address=192.168.178.64
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.4407] policy: set 'netplan-eth0' (eth0) as default for IPv4 routing and DNS
Feb 22 19:24:38 hifiberryng avahi-daemon[536]: Joining mDNS multicast group on interface eth0.IPv4 with address 192.168.178.64.
Feb 22 19:24:38 hifiberryng avahi-daemon[536]: New relevant interface eth0.IPv4 for mDNS.
Feb 22 19:24:38 hifiberryng avahi-daemon[536]: Registering new address record for 192.168.178.64 on eth0.IPv4.
Feb 22 19:24:38 hifiberryng wpa_supplicant[568]: nl80211: kernel reports: Registration to specific type not supported
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.4969] device (eth0): state change: ip-config -> ip-check (reason 'none', managed-type: 'full')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5143] device (wlan0): supplicant interface state: internal-starting -> disconnected
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5149] Wi-Fi P2P device controlled by interface wlan0 created
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5162] manager: (p2p-dev-wlan0): new 802.11 Wi-Fi P2P device (/org/freedesktop/NetworkManager/Devices/4)
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5171] device (p2p-dev-wlan0): state change: unmanaged -> unavailable (reason 'managed', managed-type: 'external')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5192] device (eth0): state change: ip-check -> secondaries (reason 'none', managed-type: 'full')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5201] device (wlan0): state change: unavailable -> disconnected (reason 'supplicant-available', managed-type: 'full')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5227] device (p2p-dev-wlan0): state change: unavailable -> disconnected (reason 'none', managed-type: 'full')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5238] device (eth0): state change: secondaries -> activated (reason 'none', managed-type: 'full')
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5255] manager: NetworkManager state is now CONNECTED_SITE
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5265] device (eth0): Activation: successful, device activated.
Feb 22 19:24:38 hifiberryng NetworkManager[567]: <info>  [1771784678.5291] manager: NetworkManager state is now CONNECTED_GLOBAL
Feb 22 19:24:38 hifiberryng sshd[994]: Server listening on 0.0.0.0 port 22.
Feb 22 19:24:38 hifiberryng sshd[994]: Server listening on :: port 22.
Feb 22 19:24:38 hifiberryng systemd[1]: Started ssh.service - OpenBSD Secure Shell server.
Feb 22 19:24:38 hifiberryng systemd[1]: Reached target multi-user.target - Multi-User System.
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Withdrawing workstation service for wlan0.
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Withdrawing address record for fe80::ba27:ebff:fe41:5440 on eth0.
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Withdrawing workstation service for eth0.
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Withdrawing address record for ::1 on lo.
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Withdrawing address record for 127.0.0.1 on lo.
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Withdrawing workstation service for lo.
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Host name conflict, retrying with hifiberryng-2
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Registering new address record for fe80::ba27:ebff:fe41:5440 on eth0.*.
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Registering new address record for 192.168.178.64 on eth0.IPv4.
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Registering new address record for ::1 on lo.*.
Feb 22 19:24:39 hifiberryng avahi-daemon[536]: Registering new address record for 127.0.0.1 on lo.IPv4.
Feb 22 19:24:40 hifiberryng avahi-daemon[536]: Server startup complete. Host name is hifiberryng-2.local. Local service cookie is 1191603785.
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0336] policy: auto-activating connection 'netplan-wlan0-sturmnetz' (7b22234a-859f-3ae9-9740-46ae93eadf64)
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0355] device (wlan0): Activation: starting connection 'netplan-wlan0-sturmnetz' (7b22234a-859f-3ae9-9740-46ae93eadf64)
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0358] device (wlan0): state change: disconnected -> prepare (reason 'none', managed-type: 'full')
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0371] device (wlan0): state change: prepare -> config (reason 'none', managed-type: 'full')
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0382] device (wlan0): Activation: (wifi) access point 'netplan-wlan0-sturmnetz' has security, but secrets are required.
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0383] device (wlan0): state change: config -> need-auth (reason 'none', managed-type: 'full')
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0389] sup-iface[7690580f23999962,0,wlan0]: wps: type pbc start...
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0427] device (wlan0): state change: need-auth -> prepare (reason 'none', managed-type: 'full')
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0437] device (wlan0): state change: prepare -> config (reason 'none', managed-type: 'full')
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0450] device (wlan0): Activation: (wifi) connection 'netplan-wlan0-sturmnetz' has security, and secrets exist.  No new secrets needed.
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0458] Config: added 'ssid' value 'sturmnetz'
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0459] Config: added 'scan_ssid' value '1'
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0459] Config: added 'bgscan' value 'simple:30:-70:86400'
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0461] Config: added 'key_mgmt' value 'WPA-PSK WPA-PSK-SHA256 FT-PSK'
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0461] Config: added 'psk' value '<hidden>'
Feb 22 19:24:41 hifiberryng wpa_supplicant[568]: wlan0: WPS-CANCEL
Feb 22 19:24:41 hifiberryng wpa_supplicant[568]: wlan0: Trying to associate with b0:f2:08:65:ed:1b (SSID='sturmnetz' freq=5580 MHz)
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0870] device (wlan0): supplicant interface state: disconnected -> associating
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.0871] device (p2p-dev-wlan0): supplicant management interface state: disconnected -> associating
Feb 22 19:24:41 hifiberryng wpa_supplicant[568]: wlan0: Associated with b0:f2:08:65:ed:1b
Feb 22 19:24:41 hifiberryng wpa_supplicant[568]: wlan0: CTRL-EVENT-SUBNET-STATUS-UPDATE status=0
Feb 22 19:24:41 hifiberryng wpa_supplicant[568]: wlan0: CTRL-EVENT-REGDOM-CHANGE init=COUNTRY_IE type=COUNTRY alpha2=DE
Feb 22 19:24:41 hifiberryng wpa_supplicant[568]: wlan0: WPA: Key negotiation completed with b0:f2:08:65:ed:1b [PTK=CCMP GTK=CCMP]
Feb 22 19:24:41 hifiberryng wpa_supplicant[568]: wlan0: CTRL-EVENT-CONNECTED - Connection to b0:f2:08:65:ed:1b completed [id=0 id_str=]
Feb 22 19:24:41 hifiberryng wpa_supplicant[568]: bgscan simple: Failed to enable signal strength monitoring
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.2605] device (wlan0): supplicant interface state: associating -> completed
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.2606] device (wlan0): Activation: (wifi) Stage 2 of 5 (Device Configure) successful. Connected to wireless network "sturmnetz"
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.2606] device (p2p-dev-wlan0): supplicant management interface state: associating -> completed
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.2611] device (wlan0): state change: config -> ip-config (reason 'none', managed-type: 'full')
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.2621] dhcp4 (wlan0): activation: beginning transaction (timeout in 45 seconds)
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.2876] dhcp4 (wlan0): state changed new lease, address=192.168.178.115, acd pending
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.4295] dhcp4 (wlan0): state changed new lease, address=192.168.178.115
Feb 22 19:24:41 hifiberryng avahi-daemon[536]: Joining mDNS multicast group on interface wlan0.IPv4 with address 192.168.178.115.
Feb 22 19:24:41 hifiberryng avahi-daemon[536]: New relevant interface wlan0.IPv4 for mDNS.
Feb 22 19:24:41 hifiberryng avahi-daemon[536]: Registering new address record for 192.168.178.115 on wlan0.IPv4.
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.4673] device (wlan0): state change: ip-config -> ip-check (reason 'none', managed-type: 'full')
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.4738] device (wlan0): state change: ip-check -> secondaries (reason 'none', managed-type: 'full')
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.4745] device (wlan0): state change: secondaries -> activated (reason 'none', managed-type: 'full')
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.4799] device (wlan0): Activation: successful, device activated.
Feb 22 19:24:41 hifiberryng NetworkManager[567]: <info>  [1771784681.4821] manager: startup complete
Feb 22 19:24:41 hifiberryng systemd[1]: Finished NetworkManager-wait-online.service - Network Manager Wait Online.
Feb 22 19:24:41 hifiberryng systemd[1]: Reached target network-online.target - Network is Online.
Feb 22 19:24:41 hifiberryng systemd[1]: Starting cloud-config.service - Cloud-init: Config Stage...
Feb 22 19:24:41 hifiberryng cloud-init[519]: Cloud-init v. 25.2 running 'modules:config' at Sun, 22 Feb 2026 18:24:41 +0000. Up 32.08 seconds.
Feb 22 19:24:41 hifiberryng sh[1000]: Completed socket interaction for boot stage config
Feb 22 19:24:41 hifiberryng systemd[1]: Finished cloud-config.service - Cloud-init: Config Stage.
Feb 22 19:24:41 hifiberryng systemd[1]: Starting cloud-final.service - Cloud-init: Final Stage...
Feb 22 19:24:42 hifiberryng sshd-session[1001]: Accepted publickey for timmo from 192.168.178.135 port 56050 ssh2: ED25519 SHA256:3kdEp/QG+3jLDKPlIfgSE4KCS69L9yL+A7AUcLNVgGg
Feb 22 19:24:42 hifiberryng sshd-session[1001]: pam_unix(sshd:session): session opened for user timmo(uid=1000) by timmo(uid=0)
Feb 22 19:24:42 hifiberryng systemd[1]: Created slice user-1000.slice - User Slice of UID 1000.
Feb 22 19:24:42 hifiberryng systemd[1]: Starting user-runtime-dir@1000.service - User Runtime Directory /run/user/1000...
Feb 22 19:24:42 hifiberryng systemd-logind[545]: New session 1 of user timmo.
Feb 22 19:24:42 hifiberryng cloud-init[519]: Cloud-init v. 25.2 running 'modules:final' at Sun, 22 Feb 2026 18:24:42 +0000. Up 32.47 seconds.
Feb 22 19:24:42 hifiberryng systemd[1]: Finished user-runtime-dir@1000.service - User Runtime Directory /run/user/1000.
Feb 22 19:24:42 hifiberryng systemd[1]: Starting user@1000.service - User Manager for UID 1000...
Feb 22 19:24:42 hifiberryng cloud-init[519]: 2026-02-22 18:24:42,278 - modules.py[WARNING]: Could not find module named cc_netplan_nm_patch (searched ['cc_netplan_nm_patch', 'cloudinit.config.cc_netplan_nm_patch'])
Feb 22 19:24:42 hifiberryng (systemd)[1011]: pam_unix(systemd-user:session): session opened for user timmo(uid=1000) by timmo(uid=0)
Feb 22 19:24:42 hifiberryng systemd-logind[545]: New session 2 of user timmo.
Feb 22 19:24:42 hifiberryng cloud-init[519]: Cloud-init v. 25.2 finished at Sun, 22 Feb 2026 18:24:42 +0000. Datasource DataSourceNoCloud [seed=ds_config_seedfrom,file:///boot/firmware].  Up 32.80 seconds
Feb 22 19:24:42 hifiberryng sh[1007]: Completed socket interaction for boot stage final
Feb 22 19:24:42 hifiberryng systemd[1]: Finished cloud-final.service - Cloud-init: Final Stage.
Feb 22 19:24:42 hifiberryng systemd[1]: Reached target cloud-init.target - Cloud-init target.
Feb 22 19:24:42 hifiberryng avahi-daemon[536]: Joining mDNS multicast group on interface wlan0.IPv6 with address fe80::ba27:ebff:fe14:115.
Feb 22 19:24:42 hifiberryng avahi-daemon[536]: New relevant interface wlan0.IPv6 for mDNS.
Feb 22 19:24:42 hifiberryng avahi-daemon[536]: Registering new address record for fe80::ba27:ebff:fe14:115 on wlan0.*.
Feb 22 19:24:42 hifiberryng systemd[1]: cloud-init-main.service: Deactivated successfully.
Feb 22 19:24:42 hifiberryng systemd[1]: cloud-init-main.service: Unit process 518 (sh) remains running after unit stopped.
Feb 22 19:24:42 hifiberryng systemd[1]: cloud-init-main.service: Unit process 519 (tee) remains running after unit stopped.
Feb 22 19:24:42 hifiberryng systemd[1]: cloud-init-main.service: Consumed 5.391s CPU time.
Feb 22 19:24:43 hifiberryng systemd[1011]: Queued start job for default target default.target.
Feb 22 19:24:43 hifiberryng systemd[1011]: Created slice app.slice - User Application Slice.
Feb 22 19:24:43 hifiberryng systemd[1011]: Reached target paths.target - Paths.
Feb 22 19:24:43 hifiberryng systemd[1011]: Reached target timers.target - Timers.
Feb 22 19:24:43 hifiberryng systemd[1011]: Starting dbus.socket - D-Bus User Message Bus Socket...
Feb 22 19:24:43 hifiberryng systemd[1011]: Listening on dirmngr.socket - GnuPG network certificate management daemon.
Feb 22 19:24:43 hifiberryng systemd[1011]: Listening on gpg-agent-browser.socket - GnuPG cryptographic agent and passphrase cache (access for web browsers).
Feb 22 19:24:43 hifiberryng systemd[1011]: Listening on gpg-agent-extra.socket - GnuPG cryptographic agent and passphrase cache (restricted).
Feb 22 19:24:43 hifiberryng systemd[1011]: Starting gpg-agent-ssh.socket - GnuPG cryptographic agent (ssh-agent emulation)...
Feb 22 19:24:43 hifiberryng systemd[1011]: Starting gpg-agent.socket - GnuPG cryptographic agent and passphrase cache...
Feb 22 19:24:43 hifiberryng systemd[1011]: Listening on keyboxd.socket - GnuPG public key management service.
Feb 22 19:24:43 hifiberryng systemd[1011]: Starting ssh-agent.socket - OpenSSH Agent socket...
Feb 22 19:24:43 hifiberryng systemd[1011]: Listening on dbus.socket - D-Bus User Message Bus Socket.
Feb 22 19:24:43 hifiberryng systemd[1011]: Listening on gpg-agent.socket - GnuPG cryptographic agent and passphrase cache.
Feb 22 19:24:43 hifiberryng systemd[1011]: Listening on ssh-agent.socket - OpenSSH Agent socket.
Feb 22 19:24:43 hifiberryng systemd[1011]: Listening on gpg-agent-ssh.socket - GnuPG cryptographic agent (ssh-agent emulation).
Feb 22 19:24:43 hifiberryng systemd[1011]: Reached target sockets.target - Sockets.
Feb 22 19:24:43 hifiberryng systemd[1011]: Reached target basic.target - Basic System.
Feb 22 19:24:43 hifiberryng systemd[1]: Started user@1000.service - User Manager for UID 1000.
Feb 22 19:24:43 hifiberryng systemd[1011]: Started mpris-proxy.service - Bluetooth mpris proxy.
Feb 22 19:24:43 hifiberryng systemd[1011]: Reached target default.target - Main User Target.
Feb 22 19:24:43 hifiberryng systemd[1011]: Startup finished in 846ms.
Feb 22 19:24:43 hifiberryng systemd[1]: Started session-1.scope - Session 1 of User timmo.
Feb 22 19:24:43 hifiberryng systemd[1]: Startup finished in 5.109s (kernel) + 28.614s (userspace) = 33.724s.
Feb 22 19:24:43 hifiberryng systemd[1011]: Created slice session.slice - User Core Session Slice.
Feb 22 19:24:43 hifiberryng systemd[1011]: Starting dbus.service - D-Bus User Message Bus...
Feb 22 19:24:43 hifiberryng systemd[1011]: Started dbus.service - D-Bus User Message Bus.
Feb 22 19:24:46 hifiberryng sshd-session[1041]: Received disconnect from 192.168.178.135 port 56050:11: disconnected by user
Feb 22 19:24:46 hifiberryng sshd-session[1041]: Disconnected from user timmo 192.168.178.135 port 56050
Feb 22 19:24:46 hifiberryng sshd-session[1001]: pam_unix(sshd:session): session closed for user timmo
Feb 22 19:24:46 hifiberryng systemd-logind[545]: Session 1 logged out. Waiting for processes to exit.
Feb 22 19:24:48 hifiberryng sshd-session[1167]: Accepted publickey for timmo from fe80::1669:bd4f:2988:1e06%eth0 port 61747 ssh2: ED25519 SHA256:3kdEp/QG+3jLDKPlIfgSE4KCS69L9yL+A7AUcLNVgGg
Feb 22 19:24:48 hifiberryng sshd-session[1167]: pam_unix(sshd:session): session opened for user timmo(uid=1000) by timmo(uid=0)
Feb 22 19:24:48 hifiberryng systemd-logind[545]: New session 3 of user timmo.
Feb 22 19:24:48 hifiberryng systemd[1]: Started session-3.scope - Session 3 of User timmo.
Feb 22 19:24:48 hifiberryng systemd[1]: NetworkManager-dispatcher.service: Deactivated successfully.
Feb 22 19:25:03 hifiberryng systemd-timesyncd[329]: Contacted time server 185.252.140.126:123 (2.debian.pool.ntp.org).
Feb 22 19:25:03 hifiberryng systemd-timesyncd[329]: Initial clock synchronization to Sun 2026-02-22 19:25:03.548137 CET.
Feb 22 19:25:08 hifiberryng systemd[1]: systemd-hostnamed.service: Deactivated successfully.
Feb 22 19:25:32 hifiberryng wpa_supplicant[568]: wlan0: WPA: Group rekeying completed with b0:f2:08:65:ed:1b [GTK=CCMP]
Feb 22 19:26:19 hifiberryng sudo[1548]:    timmo : TTY=pts/0 ; PWD=/home/timmo ; USER=root ; COMMAND=/usr/bin/journalctl -b --no-pager
Feb 22 19:26:19 hifiberryng sudo[1548]: pam_unix(sudo:session): session opened for user root(uid=0) by timmo(uid=1000)


git clone --branch hbosng --single-branch https://github.com/timmost/hifiberry-os hbosng