# Ubuntu Setup

Automated setup scripts and documentation for fresh Ubuntu installations.

## Quick Start

1. Clone this repository:
```bash
git clone git@github.com:miles-codes/ubuntu-setup.git
cd ubuntu-setup
```

2. Run the interactive installer:
```bash
./install.sh
```

3. Follow the on-screen prompts to select applications and configurations.

## Features

- **Interactive Installation**: Use a menu-driven interface to select which applications to install
- **Modular Design**: Apps organized by category for easy maintenance
- **System Configuration**: Automated setup for Git, Bash, and other common configurations
- **Manual Instructions**: Detailed documentation available for manual installation

## Directory Structure

```
ubuntu-setup/
├── install.sh              # Main interactive installation script
├── scripts/
│   ├── apps/              # Application installation scripts
│   │   ├── development.sh # Development tools (Git, IDEs, etc.)
│   │   ├── utilities.sh   # System utilities (curl, btop, etc.)
│   │   └── browsers.sh    # Web browsers
│   └── config/            # Configuration scripts
│       ├── git-setup.sh   # Git configuration
│       └── bash-setup.sh  # Bash aliases and settings
├── dotfiles/              # Configuration files (future use)
└── docs/
    └── APPS.md           # Detailed manual installation instructions
```

## Available Applications

### System Utilities
- **curl** - Command-line data transfer tool
- **btop** - Modern resource monitor
- **Zellij** - Terminal multiplexer

### Development Tools
- **Git** - Version control system
- **Docker** - Container platform
- **Node.js** - JavaScript runtime (via nvm)
- **PostgreSQL** - Object-relational database
- **Beekeeper Studio** - Database management GUI
- **uv** - Python package installer
- **Sublime Text** - Text editor
- **PyCharm Community** - Python IDE
- **WebStorm** - JavaScript/TypeScript IDE
- **Claude Code** - AI coding assistant CLI

### Browsers
- **Brave Browser** (Nightly) - Privacy-focused browser

### Productivity
- **Xournal++** - Note-taking and PDF annotation

## Usage

### Interactive Mode (Recommended)

Simply run the main script:
```bash
./install.sh
```

The interactive menu allows you to:
1. Select multiple applications to install at once
2. Configure system settings (Git, Bash, etc.)
3. Update system packages

### Manual Installation

For manual installation instructions, see [docs/APPS.md](docs/APPS.md).

## Adding New Applications

To add a new application:

1. Add the installation function to the appropriate script in `scripts/apps/`
2. Export the function at the end of the script
3. Add the app to the checklist in `install.sh` (in the `show_apps_menu` function)
4. Add documentation to `docs/APPS.md`

Example:
```bash
# In scripts/apps/utilities.sh
install_myapp() {
    echo "Installing My App..."
    sudo apt install -y myapp
}

export -f install_myapp
```

## Requirements

- Ubuntu (tested on Ubuntu 24.04)
- sudo privileges
- Internet connection

## Contributing

Feel free to add more applications or improve the scripts. Keep the modular structure and update documentation accordingly.

## License

This is a personal setup repository. Feel free to fork and adapt for your own use.
