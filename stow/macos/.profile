# Set XDG paths
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="$HOME/Library/Caches/TemporaryItems"

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
export ASDF_DATA_DIR="$XDG_DATA_HOME"/asdf
export ANSIBLE_HOME="$XDG_DATA_HOME"/ansible
export AZURE_CONFIG_DIR="$XDG_DATA_HOME"/azure
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export WGETRC="$XDG_CONFIG_HOME/wget/.wgetrc"
export ZDOTDIR="$HOME"/.config/zsh

# History files
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export LESSHISTFILE="$XDG_STATE_HOME"/less/history

## Mise
export MISE_NODE_DEFAULT_PACKAGES_FILE="$XDG_CONFIG_HOME/mise/.default-npm-packages"

## Android
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export ANDROID_HOME="$HOME/Library/Android/sdk"

## iOS/macOS
export CP_HOME_DIR="$XDG_DATA_HOME"/cocoapods

## Go
export GOPATH="$XDG_DATA_HOME"/go

## Node/NPM
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
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

## usql
export USQL_HISTORY="$XDG_DATA_HOME"/usql/history
export USQLRC="$XDG_CONFIG_HOME"/usql/config

# Set application configuration

## 1Password
## This is so applications like Ansible can decrypt SSH private keys
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

## DuckDB
export DUCKDB_HISTORY="$XDG_DATA_HOME"/duckdb/history

## atuin
## Prevent atuin from binding any keyboard shortcuts, because I use fzf
export ATUIN_NOBIND=1

## fzf
## Set some defaults for fzf.
## I think the fish-fzf plugin might be overriding these though.
export FZF_DEFAULT_COMMAND="fd -H -tf"
export FZF_DEFAULT_OPTS="--cycle"

## zoxide
## Set default fzf options for zoxide
export _ZO_FZF_OPTS="--cycle --height 10"

# Update $PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/cargo/bin:$PATH"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

. "$CARGO_HOME/env"
. "/Users/hassankhan/.local/share/cargo/env"

