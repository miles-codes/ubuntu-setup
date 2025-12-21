#!/bin/bash

# Browsers Installation Script

install_brave() {
    echo "Installing Brave Browser (Nightly)..."
    curl -fsS https://dl.brave.com/install.sh | CHANNEL=nightly sh
}

# Export functions so they can be called from main script
export -f install_brave
