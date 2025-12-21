#!/bin/bash

# Git Configuration Script

configure_git() {
    echo "Configuring Git..."

    read -p "Enter your full name for Git: " git_name
    read -p "Enter your email for Git: " git_email

    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    git config --global init.defaultBranch master

    echo "Git configured successfully!"
    echo "Name: $git_name"
    echo "Email: $git_email"
    echo "Default branch: master"
}

# Export function so it can be called from main script
export -f configure_git
