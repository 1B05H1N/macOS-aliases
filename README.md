# macOS-aliases

> **DISCLAIMER:** Use at your own risk. No guarantees. Review before use, especially if you don't know what you're doing.

A collection of shell aliases and functions for macOS (with some Linux compatibility).

## Features
- **macOS-focused**: All aliases are tailored for macOS, with platform checks and install notes.
- **Security & Pentesting**: Shortcuts for nmap, masscan, ffuf, gobuster, subdomain tools, and more—auto-guarded so only defined if installed.
- **Productivity**: Classic bash, Docker, Git, and system shortcuts.
- **Safety**: Interactive flags and dangerous command warnings.
- **Modular**: Easy to split into sub-files (e.g., `pentest.sh`, `git_aliases.sh`).

## Directory Structure & File Reference

Recommended structure for clarity and modularity:

```
macOS-aliases/
├── aliases.sh              # Main entry point, sources all modules
├── modules/                # All modular alias files live here
│   ├── core_aliases.sh     # Core/general/macOS aliases
│   ├── git_aliases.sh      # Git and version control aliases
│   ├── docker_aliases.sh   # Docker and virtualization aliases
│   └── pentest_aliases.sh  # Security/pentesting aliases
├── aliases_reference.txt   # Human-readable reference for all aliases
├── README.md               # This documentation
```

**File Descriptions:**
- `aliases.sh`: Main entry point. Sources all sub-files in `modules/`.
- `modules/core_aliases.sh`: General, system, productivity, and macOS-specific aliases.
- `modules/git_aliases.sh`: All Git and version control aliases.
- `modules/docker_aliases.sh`: Docker and virtualization aliases.
- `modules/pentest_aliases.sh`: Security and pentesting aliases, with tool guards.
- `aliases_reference.txt`: Full, commented reference for all aliases.
- `README.md`: This documentation and usage guide.

**Install/Source Example:**
```sh
# In your ~/.zshrc or ~/.bash_profile
source ~/macOS-aliases/aliases.sh
```

**Advanced:**
You can add or remove modules in the `modules/` directory and update `aliases.sh` to source only what you want.

## Installation
1. **Clone this repo**
   ```