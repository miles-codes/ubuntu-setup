#!/bin/bash

# Development Tools Installation Script

install_git() {
    echo "Installing git..."
    sudo apt install -y git-all
}

install_sublime() {
    echo "Installing Sublime Text..."
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
    echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
    sudo apt-get update
    sudo apt-get install -y sublime-text
}

install_pycharm() {
    echo "Installing PyCharm..."
    sudo snap install pycharm-community --classic
}

install_webstorm() {
    echo "Installing WebStorm..."
    sudo snap install webstorm --classic
}

install_claude_code() {
    echo "Installing Claude Code..."
    curl -fsSL https://claude.ai/install.sh | bash

    # Add to PATH if not already present
    if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
        echo "Added Claude Code to PATH in ~/.bashrc"
    fi
}

install_docker() {
    echo "Installing Docker using convenience script..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    rm get-docker.sh

    # Add current user to docker group to run docker without sudo
    echo "Adding current user to docker group..."
    sudo usermod -aG docker $USER

    echo "Docker installed successfully!"
    echo "Note: You may need to log out and back in for docker group changes to take effect."
}

install_uv() {
    echo "Installing uv (Python package installer)..."
    curl -LsSf https://astral.sh/uv/install.sh | sh

    # Add to PATH if not already present
    if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
        echo "Added uv to PATH in ~/.bashrc"
    fi

    echo "uv installed successfully!"
    echo "Note: You may need to restart your shell or run 'source ~/.bashrc' for PATH changes to take effect."
}

install_node() {
    echo "Installing Node.js using nvm (Node Version Manager)..."

    # Install nvm
    local NVM_VERSION="v0.40.1"
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash

    # Load nvm into current shell session
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    # Install latest LTS version of Node.js
    echo "Installing latest LTS version of Node.js..."
    nvm install --lts

    # Set the LTS version as default
    nvm alias default 'lts/*'

    echo "Node.js and nvm installed successfully!"
    echo "Node version: $(node --version)"
    echo "npm version: $(npm --version)"
    echo "Note: nvm has been added to your ~/.bashrc. Restart your shell or run 'source ~/.bashrc' to use it."
}

install_postgresql() {
    echo "Installing PostgreSQL 18..."

    # Install postgresql-common first
    sudo apt install -y postgresql-common

    # Run the official PostgreSQL repository setup script
    echo "Setting up PostgreSQL APT repository..."
    sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y

    # Update package lists
    sudo apt update

    # Install PostgreSQL 18
    sudo apt install -y postgresql-18

    echo "PostgreSQL 18 installed successfully!"
    echo "PostgreSQL version: $(psql --version)"
    echo ""
    echo "PostgreSQL service status:"
    sudo systemctl status postgresql --no-pager | head -n 5
    echo ""
    echo "To access PostgreSQL:"
    echo "  sudo -u postgres psql"
    echo ""
    echo "To create a new database user:"
    echo "  sudo -u postgres createuser --interactive"
}

install_beekeeper_studio() {
    echo "Installing Beekeeper Studio..."

    # Set up the repository
    curl -fsSL https://deb.beekeeperstudio.io/beekeeper.key | sudo gpg --dearmor --output /usr/share/keyrings/beekeeper.gpg
    sudo chmod go+r /usr/share/keyrings/beekeeper.gpg
    echo "deb [signed-by=/usr/share/keyrings/beekeeper.gpg] https://deb.beekeeperstudio.io stable main" \
        | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list > /dev/null

    # Install the application
    sudo apt update
    sudo apt install -y beekeeper-studio

    echo "Beekeeper Studio installed successfully!"
}

# Export functions so they can be called from main script
export -f install_git
export -f install_sublime
export -f install_pycharm
export -f install_webstorm
export -f install_claude_code
export -f install_docker
export -f install_uv
export -f install_node
export -f install_postgresql
export -f install_beekeeper_studio
