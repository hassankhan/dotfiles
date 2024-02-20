# Source cross-shell environment variables
fenv source ~/.profile

# Commands to run in interactive sessions can go here
if status is-interactive

    # iTerm2 integration
    test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

    # Input customizations/enhancements
    test -e {$HOME}/.config/fish/conf.d/abbr.fish ; and source {$HOME}/.config/fish/conf.d/abbr.fish
    test -e {$HOME}/.config/fish/conf.d/aliases.fish ; and source {$HOME}/.config/fish/conf.d/aliases.fish
    test -e {$HOME}/.config/fish/conf.d/paths.fish ; and source {$HOME}/.config/fish/conf.d/paths.fish
    test -e {$HOME}/.config/fish/conf.d/utils.fish ; and source {$HOME}/.config/fish/conf.d/utils.fish
    
    # Shell customizations
    atuin init fish | source
    starship init fish | source
    zoxide init fish | source
end