#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {

    # Copy files to Home folder
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "dev.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        --exclude ".macos" \
        -avh --no-perms . ~;

    # Change current working directory to Home folder
    cd ~;
    # Install apps/utilities from Homebrew
    brew bundle;
    # Set macOS defaults
    # ./.macos;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
