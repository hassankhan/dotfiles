#!/usr/bin/env bash

current_directory=$(pwd)

# Use TouchID for sudo
sudo cp config/macos/sudo_local /etc/pam.d/sudo_local;

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

# Install Homebrew formulae and casks
brew bundle

# Run Stow
cd stow
for FOLDER in */; do
    # Extract folder name
    FOLDER_NAME="${FOLDER%/}"
    # Run stow for each folder
    if [ "$FOLDER_NAME" = "claude" ]; then
        # ~/.claude also holds host state and other installers' files, so link files, never the folder
        stow --no-folding -t ~ "$FOLDER_NAME"
    else
        stow -t ~ "$FOLDER_NAME"
    fi
done
cd $current_directory

# Merge owned Codex, Claude Code and Cursor settings into the live files
mise install uv
mise exec uv -- ./agents/sync apply

# Install Fisher plugins
fish -c 'fisher update'

# Set macOS preferences
./config/macos/.macos

# Create Tower environment.plist file so Git commit hooks work
file=~/Library/Application\ Support/com.fournova.Tower3/environment.plist
if [ ! -f "$file" ]; then
    touch "$file"
fi
defaults write "$file" PATH "$PATH"
