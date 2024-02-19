#!/usr/bin/env bash

current_directory=$(pwd)

# Use TouchID for sudo
sudo cp config/macos/sudo_local /etc/pam.d/sudo_local;

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

# Install Homebrew formulae and casks
cp Brewfile ~
cd ~
brew bundle
cd $current_directory

# Run Stow
cd stow
for FOLDER in */; do
    # Extract folder name
    FOLDER_NAME="${FOLDER%/}"
    # Run stow for each folder
    stow -t ~ "$FOLDER_NAME"
done
cd $current_directory

# Set macOS preferences
./config/.macos

# Set Bartender preferences
cp init/com.surteesstudios.Bartender.plist ~/Library/Preferences

# Create Tower environment.plist file so Git commit hooks work
file=~/Library/Application\ Support/com.fournova.Tower3/environment.plist
if [ ! -f "$file" ]; then
    touch "$file"
fi
defaults write "$file" PATH "$PATH"
