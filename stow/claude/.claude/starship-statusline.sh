#!/bin/bash

# Read JSON input from Claude Code
input=$(cat)

# Extract data from JSON
current_dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model_name=$(echo "$input" | jq -r '.model.display_name')

# Gruvbox Dark colors (matching your Starship config)
color_fg0='\033[38;2;251;241;199m'    # #fbf1c7
color_orange='\033[48;2;214;93;14m'   # bg: #d65d0e  
color_yellow='\033[48;2;215;153;33m'  # bg: #d79921
color_aqua='\033[48;2;104;157;106m'   # bg: #689d6a
color_black='\033[38;2;66;66;66m'     # #424242
color_reset='\033[0m'

# OS symbol (macOS)
os_symbol="󰀵"

# Get username
username=$(whoami)

# Process directory path similar to Starship's truncation
dir_path="$current_dir"
# Replace home directory with ~
dir_path="${dir_path/#$HOME/\~}"

# Apply directory substitutions (matching your Starship config)
dir_path="${dir_path//Documents/󰈙 }"
dir_path="${dir_path//Downloads/ }"
dir_path="${dir_path//Music/󰝚 }"
dir_path="${dir_path//Pictures/ }"
dir_path="${dir_path//Developer/󰲋 }"

# Truncate path if too long (8 segments like your config)
IFS='/' read -ra PATH_PARTS <<< "$dir_path"
if [ ${#PATH_PARTS[@]} -gt 8 ]; then
    # Keep first part (~ or /) and last 7 parts
    truncated_path="${PATH_PARTS[0]}/…"
    for ((i=${#PATH_PARTS[@]}-7; i<${#PATH_PARTS[@]}; i++)); do
        if [ "$i" -ge 0 ]; then
            truncated_path="$truncated_path/${PATH_PARTS[i]}"
        fi
    done
    dir_path="$truncated_path"
fi

# Get git branch if in a git repository
git_branch=""
if git rev-parse --git-dir >/dev/null 2>&1; then
    branch_name=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch_name" ]; then
        git_branch=" $branch_name"
    fi
fi

# Build the status line
printf "${color_orange}${color_fg0} ${os_symbol} ${username} ${color_reset}"
printf "${color_yellow}${color_black} ${dir_path} ${color_reset}"

if [ -n "$git_branch" ]; then
    printf "${color_aqua}${color_fg0} ${git_branch} ${color_reset}"
fi

# Add model info at the end
printf " ${model_name}"