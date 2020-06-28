#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

BREW_PREFIX=$(brew --prefix)

function doIt() {

    installation_types=("personal" "work")
    read -p 'Is this being installed on a personal or work machine: ' INSTALLATION_TYPE;

    # If unrecognised installation type
    if [[ ! " ${installation_types[@]} " =~ " ${INSTALLATION_TYPE} " ]]; then
        echo "Installation type must be one of: personal, work";
        exit 1;
    fi

    cp Brewfile-${INSTALLATION_TYPE} Brewfile;

    # Copy files to Home folder
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "dev.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        --exclude "Brewfile-*" \
        -avh --no-perms . ~;

    # Change current working directory to Home folder
    cd ~;
    # Install apps/utilities from Homebrew
    brew bundle;
    # Set Homebrew-installed Bash as default
    if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
        echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
        chsh -s "${BREW_PREFIX}/bin/bash";
    fi;

    source ~/.bash_profile;
    ./.macos;
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
