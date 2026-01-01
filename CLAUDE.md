# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Ubuntu setup automation scripts with an interactive whiptail-based installer for fresh Ubuntu systems.

## Running the Installer

```bash
./install.sh
```

## Architecture

**Entry point**: `install.sh` - Interactive menu using whiptail that sources all module scripts and dispatches to installation functions.

**Script modules** (sourced by install.sh):
- `scripts/apps/development.sh` - Dev tools (git, docker, node, IDEs, databases)
- `scripts/apps/utilities.sh` - System utilities (curl, btop, zellij)
- `scripts/apps/browsers.sh` - Web browsers
- `scripts/config/git-setup.sh` - Git configuration
- `scripts/config/bash-setup.sh` - Bash aliases

## Adding New Applications

1. Add `install_<appname>()` function to appropriate script in `scripts/apps/`
2. Add `export -f install_<appname>` at end of that script
3. Add entry to `show_apps_menu()` checklist in `install.sh`
4. Add case handler in the `for app in $apps` loop in `install.sh`

Pattern for installation functions:
```bash
install_example() {
    echo "Installing Example..."
    # Setup repo if needed, then apt install
    sudo apt install -y example
    echo "Example installed successfully!"
}
```
