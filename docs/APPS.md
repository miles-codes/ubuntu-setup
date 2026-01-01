# Applications Installation Guide

This document provides manual installation instructions for all supported applications. For automated installation, use the `install.sh` script in the root directory.

## Table of Contents
- [System Utilities](#system-utilities)
- [Development Tools](#development-tools)
- [Browsers](#browsers)
- [Productivity](#productivity)
- [Configuration](#configuration)

---

## System Utilities

### curl
Command-line tool for transferring data with URLs.

```bash
sudo apt install curl
```

### btop
Modern and colorful command-line resource monitor (alternative to htop).

```bash
sudo apt install btop
```

### Zellij
Terminal workspace with batteries included (modern alternative to tmux).

```bash
# Download the latest version
ZELLIJ_VERSION="v0.41.2"
curl -L "https://github.com/zellij-org/zellij/releases/download/${ZELLIJ_VERSION}/zellij-x86_64-unknown-linux-musl.tar.gz" -o zellij.tar.gz

# Extract and install
tar -xzf zellij.tar.gz
sudo mv zellij /usr/local/bin/
sudo chmod +x /usr/local/bin/zellij

# Cleanup
rm zellij.tar.gz

# Run zellij
zellij
```

For more information, see the [official Zellij documentation](https://zellij.dev/).

---

## Development Tools

### git
Distributed version control system.

```bash
sudo apt install git-all
```

### Docker
Platform for developing, shipping, and running applications in containers.

```bash
# Using the official Docker convenience script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh

# Add current user to docker group (to run docker without sudo)
sudo usermod -aG docker $USER

# Note: Log out and back in for group changes to take effect
```

For more information, see the [official Docker documentation](https://docs.docker.com/engine/install/ubuntu/).

### Node.js (via nvm)
JavaScript runtime built on Chrome's V8 engine. Installed using nvm (Node Version Manager) for easy version management.

```bash
# Install nvm
NVM_VERSION="v0.40.1"
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash

# Load nvm (or restart your terminal)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install latest LTS version of Node.js
nvm install --lts

# Set LTS as default
nvm alias default 'lts/*'

# Verify installation
node --version
npm --version
```

**Common nvm commands:**
- `nvm install <version>` - Install a specific Node.js version
- `nvm use <version>` - Switch to a specific version
- `nvm list` - List installed versions
- `nvm current` - Show current version

For more information, see the [official nvm documentation](https://github.com/nvm-sh/nvm).

### PostgreSQL
Powerful, open-source object-relational database system. This installs PostgreSQL 18.

**Automated Installation (Recommended):**
```bash
# Install postgresql-common package
sudo apt install -y postgresql-common

# Run the official PostgreSQL repository setup script
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y

# Update and install PostgreSQL 18
sudo apt update
sudo apt install -y postgresql-18
```

**Manual Installation:**
```bash
# Install dependencies and import the repository signing key
sudo apt install curl ca-certificates
sudo install -d /usr/share/postgresql-common/pgdg
sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc

# Create the repository configuration file
. /etc/os-release
sudo sh -c "echo 'deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $VERSION_CODENAME-pgdg main' > /etc/apt/sources.list.d/pgdg.list"

# Update and install PostgreSQL 18
sudo apt update
sudo apt install -y postgresql-18
```

**Common PostgreSQL commands:**
- Access PostgreSQL prompt: `sudo -u postgres psql`
- Create a database: `sudo -u postgres createdb mydb`
- Create a user: `sudo -u postgres createuser --interactive`
- List databases: `\l` (inside psql)
- Connect to database: `\c dbname` (inside psql)
- Exit psql: `\q`

**Create a database and user:**
```bash
# Switch to postgres user and access psql
sudo -u postgres psql

# Create database and user (inside psql)
CREATE DATABASE myapp;
CREATE USER myuser WITH PASSWORD 'mypassword';
GRANT ALL PRIVILEGES ON DATABASE myapp TO myuser;
\q
```

For more information, see the [official PostgreSQL documentation](https://www.postgresql.org/docs/).

### Beekeeper Studio
Universal database manager and SQL editor with support for MySQL, PostgreSQL, SQLite, SQL Server, and more.

```bash
# Set up the repository
curl -fsSL https://deb.beekeeperstudio.io/beekeeper.key | sudo gpg --dearmor --output /usr/share/keyrings/beekeeper.gpg
sudo chmod go+r /usr/share/keyrings/beekeeper.gpg
echo "deb [signed-by=/usr/share/keyrings/beekeeper.gpg] https://deb.beekeeperstudio.io stable main" \
    | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list > /dev/null

# Install
sudo apt update
sudo apt install -y beekeeper-studio
```

For more information, see the [official Beekeeper Studio documentation](https://docs.beekeeperstudio.io/).

### uv
Extremely fast Python package installer and resolver (modern alternative to pip).

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh

# Add to PATH if not already present
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
```

For more information, see the [official uv documentation](https://docs.astral.sh/uv/).

### Sublime Text
Sophisticated text editor for code, markup, and prose.

```bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
sudo apt-get update
sudo apt-get install sublime-text
```

### PyCharm Community
Python IDE for professional developers.

```bash
sudo snap install pycharm-community --classic
```

### WebStorm
JavaScript and TypeScript IDE.

```bash
sudo snap install webstorm --classic
```

### Claude Code
AI-powered coding assistant CLI.

```bash
curl -fsSL https://claude.ai/install.sh | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
```

---

## Browsers

### Brave Browser (Nightly)
Privacy-focused browser built on Chromium.

```bash
curl -fsS https://dl.brave.com/install.sh | CHANNEL=nightly sh
```

---

## Productivity

### Xournal++
Note-taking software and PDF annotator.

```bash
sudo apt install xournalpp
```

---

## Configuration

### Git Configuration
Set up your Git identity and preferences.

```bash
git config --global user.name "Your Name"
git config --global user.email your.email@example.com
git config --global init.defaultBranch master
```

**Useful Git Aliases:**
```bash
# List all tags in ascending order with date and annotation
git config --global alias.tags "tag -l --sort=creatordate --format='%(creatordate:short) %(refname:short) - %(contents:subject)'"

# Usage: git tags
```

### Bash Aliases
Add common aliases to your `.bashrc`:

```bash
# Add to ~/.bashrc
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
```
