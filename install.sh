#!/bin/bash

# Ubuntu Setup Installation Script
# Interactive installer for setting up a fresh Ubuntu system

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Source all app installation scripts
source "$SCRIPT_DIR/scripts/apps/development.sh"
source "$SCRIPT_DIR/scripts/apps/utilities.sh"
source "$SCRIPT_DIR/scripts/apps/browsers.sh"
source "$SCRIPT_DIR/scripts/config/git-setup.sh"
source "$SCRIPT_DIR/scripts/config/bash-setup.sh"

# Function to print colored messages
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${YELLOW}→${NC} $1"
}

# Check if running on Ubuntu
check_system() {
    if [ ! -f /etc/os-release ]; then
        print_error "Cannot detect OS. This script is designed for Ubuntu."
        exit 1
    fi

    . /etc/os-release
    if [[ "$ID" != "ubuntu" ]]; then
        print_error "This script is designed for Ubuntu. Detected: $ID"
        exit 1
    fi

    print_success "Running on Ubuntu $VERSION"
}

# Check if whiptail is available (for interactive menus)
check_dependencies() {
    if ! command -v whiptail &> /dev/null; then
        print_info "Installing whiptail for interactive menus..."
        sudo apt update
        sudo apt install -y whiptail
    fi
}

# Update system packages
update_system() {
    print_info "Updating system packages..."
    sudo apt update
    sudo apt upgrade -y
    print_success "System updated"
}

# Main menu
show_main_menu() {
    local choice
    choice=$(whiptail --title "Ubuntu Setup Installer" --menu \
        "Choose an option:" 20 70 10 \
        "1" "Install Applications" \
        "2" "Configure System Settings" \
        "3" "Update System Packages" \
        "4" "Exit" \
        3>&1 1>&2 2>&3)

    case $choice in
        1) show_apps_menu ;;
        2) show_config_menu ;;
        3) update_system; show_main_menu ;;
        4) exit 0 ;;
        *) exit 0 ;;
    esac
}

# Apps installation menu with checkboxes
show_apps_menu() {
    local apps
    apps=$(whiptail --title "Select Applications to Install" --checklist \
        "Use SPACE to select, ENTER to confirm:" 25 70 15 \
        "curl" "Command-line tool for transferring data" OFF \
        "btop" "Resource monitor (modern htop)" OFF \
        "zellij" "Terminal multiplexer" OFF \
        "git" "Version control system" OFF \
        "docker" "Container platform" OFF \
        "node" "Node.js (via nvm)" OFF \
        "postgresql" "PostgreSQL database" OFF \
        "beekeeper-studio" "Database management GUI" OFF \
        "uv" "Python package installer (pip alternative)" OFF \
        "sublime" "Sublime Text editor" OFF \
        "brave" "Brave Browser (Nightly)" OFF \
        "pycharm" "PyCharm Community IDE" OFF \
        "webstorm" "WebStorm IDE" OFF \
        "xournalpp" "Note-taking and PDF annotation" OFF \
        "claude-code" "Claude Code CLI" OFF \
        3>&1 1>&2 2>&3)

    if [ -z "$apps" ]; then
        print_info "No applications selected"
        show_main_menu
        return
    fi

    # Convert selected apps to array
    apps=$(echo "$apps" | tr -d '"')

    print_info "Installing selected applications..."

    for app in $apps; do
        case $app in
            curl) install_curl ;;
            btop) install_btop ;;
            zellij) install_zellij ;;
            git) install_git ;;
            docker) install_docker ;;
            node) install_node ;;
            postgresql) install_postgresql ;;
            beekeeper-studio) install_beekeeper_studio ;;
            uv) install_uv ;;
            sublime) install_sublime ;;
            brave) install_brave ;;
            pycharm) install_pycharm ;;
            webstorm) install_webstorm ;;
            xournalpp) install_xournalpp ;;
            claude-code) install_claude_code ;;
        esac
    done

    print_success "All selected applications installed!"

    # Ask if user wants to return to main menu
    if whiptail --title "Installation Complete" --yesno "Return to main menu?" 8 50; then
        show_main_menu
    fi
}

# Configuration menu
show_config_menu() {
    local configs
    configs=$(whiptail --title "System Configuration" --checklist \
        "Use SPACE to select, ENTER to confirm:" 15 70 5 \
        "git" "Configure Git (name, email, defaults)" OFF \
        "bash" "Setup bash aliases" OFF \
        3>&1 1>&2 2>&3)

    if [ -z "$configs" ]; then
        print_info "No configurations selected"
        show_main_menu
        return
    fi

    # Convert selected configs to array
    configs=$(echo "$configs" | tr -d '"')

    for config in $configs; do
        case $config in
            git) configure_git ;;
            bash) setup_bash_aliases ;;
        esac
    done

    print_success "Configuration complete!"

    # Ask if user wants to return to main menu
    if whiptail --title "Configuration Complete" --yesno "Return to main menu?" 8 50; then
        show_main_menu
    fi
}

# Show welcome message
show_welcome() {
    whiptail --title "Ubuntu Setup Installer" --msgbox \
        "Welcome to the Ubuntu Setup Installer!\n\n\
This script will help you install applications and configure your Ubuntu system.\n\n\
Press OK to continue." 12 70
}

# Main execution
main() {
    clear
    echo "======================================"
    echo "  Ubuntu Setup Installer"
    echo "======================================"
    echo

    check_system
    check_dependencies

    show_welcome
    show_main_menu
}

# Run main function
main
