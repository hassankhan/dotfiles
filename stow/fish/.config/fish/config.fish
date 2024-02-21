# Source cross-shell environment variables
fenv source ~/.profile

# Commands to run in interactive sessions can go here
if status is-interactive

    # Input customizations/enhancements
    test -e {$HOME}/.config/fish/conf.d/abbr.fish ; and source {$HOME}/.config/fish/conf.d/abbr.fish
    test -e {$HOME}/.config/fish/conf.d/aliases.fish ; and source {$HOME}/.config/fish/conf.d/aliases.fish
    test -e {$HOME}/.config/fish/conf.d/iterm2.fish ; and source {$HOME}/.config/fish/conf.d/iterm2.fish
    test -e {$HOME}/.config/fish/conf.d/utils.fish ; and source {$HOME}/.config/fish/conf.d/utils.fish
    
    # Shell customizations
    atuin init fish | source
    starship init fish | source
    zoxide init --cmd cd fish | source
end