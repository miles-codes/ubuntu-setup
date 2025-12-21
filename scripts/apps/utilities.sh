#!/bin/bash

# System Utilities Installation Script

install_curl() {
    echo "Installing curl..."
    sudo apt install -y curl
}

install_btop() {
    echo "Installing btop..."
    sudo apt install -y btop
}

install_xournalpp() {
    echo "Installing Xournal++..."
    sudo apt install -y xournalpp
}

install_zellij() {
    echo "Installing Zellij..."

    # Download the latest zellij binary
    local ZELLIJ_VERSION="v0.41.2"
    local ARCH="x86_64"
    local DOWNLOAD_URL="https://github.com/zellij-org/zellij/releases/download/${ZELLIJ_VERSION}/zellij-${ARCH}-unknown-linux-musl.tar.gz"

    # Create temp directory
    local TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"

    # Download and extract
    curl -L "$DOWNLOAD_URL" -o zellij.tar.gz
    tar -xzf zellij.tar.gz

    # Install to /usr/local/bin
    sudo mv zellij /usr/local/bin/
    sudo chmod +x /usr/local/bin/zellij

    # Cleanup
    cd -
    rm -rf "$TEMP_DIR"

    echo "Zellij installed successfully!"
    echo "Run 'zellij' to start a new session"
}

# Export functions so they can be called from main script
export -f install_curl
export -f install_btop
export -f install_xournalpp
export -f install_zellij
