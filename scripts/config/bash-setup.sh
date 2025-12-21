#!/bin/bash

# Bash Configuration Script

setup_bash_aliases() {
    echo "Setting up bash aliases..."

    local bashrc="$HOME/.bashrc"
    local aliases_section="
# Custom aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
"

    # Check if aliases already exist
    if ! grep -q "# Custom aliases" "$bashrc"; then
        echo "$aliases_section" >> "$bashrc"
        echo "Bash aliases added to ~/.bashrc"
    else
        echo "Bash aliases already configured"
    fi
}

# Export function so it can be called from main script
export -f setup_bash_aliases
