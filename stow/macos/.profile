# Set XDG paths
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="$HOME/Library/Caches/TemporaryItems"

# Update $PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Make Fleet the default editor
export EDITOR='fleet';

# Prefer GB English and use UTF-8.
export LANG='en_GB.UTF-8';
export LC_ALL='en_GB.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don't clear the screen after quitting a manual page.
export MANPAGER='less';

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

# Set application paths
export ANSIBLE_HOME="$XDG_DATA_HOME"/ansible
export AZURE_CONFIG_DIR="$XDG_DATA_HOME"/azure
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export ZDOTDIR="$HOME"/.config/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export LESSHISTFILE="$XDG_STATE_HOME"/less/history

## Mise
export MISE_NODE_DEFAULT_PACKAGES_FILE="$XDG_CONFIG_HOME/mise/.default-npm-packages"

## Android
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android

## iOS/macOS
export CP_HOME_DIR="$XDG_DATA_HOME"/cocoapods

## Go
export GOPATH="$XDG_DATA_HOME"/go

## Node/NPM
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node/node_repl_history
export NODE_REPL_HISTORY_SIZE='32768';
export NODE_REPL_MODE='sloppy';
export TS_NODE_HISTORY="$XDG_STATE_HOME"/ts_node_repl_history

## Python
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"

## Ruby
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

## Rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

. "$CARGO_HOME/env"

## atuin
export ATUIN_NOBIND=1

## fzf
export FZF_DEFAULT_COMMAND="fd -H -tf"