#!/bin/bash

# Git Configuration Script

configure_git() {
    echo "Configuring Git..."

    read -p "Enter your full name for Git: " git_name
    read -p "Enter your email for Git: " git_email

    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    git config --global init.defaultBranch master

    # Add useful git aliases
    git config --global alias.tags "tag -l --sort=creatordate --format='%(creatordate:short) %(refname:short) - %(contents:subject)'"

    echo "Git configured successfully!"
    echo "Name: $git_name"
    echo "Email: $git_email"
    echo "Default branch: master"
    echo ""
    echo "Useful aliases added:"
    echo "  git tags - List all tags in ascending order with date and annotation"
}

# Export function so it can be called from main script
export -f configure_git
