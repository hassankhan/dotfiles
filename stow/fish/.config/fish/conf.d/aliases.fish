alias dc="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"

alias cat="bat"
alias ls="eza -lag --header --group-directories-first --binary"
alias ping="gping"
alias timg="timg -pi"
alias tree="broot -s"

alias flush_dns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Create aliases so applications use XDG paths 
alias adb='HOME="$XDG_DATA_HOME"/android command adb'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
# Need to find a way to make this work for Yarn 1 and 2+
# alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

alias cleanup_macos="fd -u .DS_Store -x rm"
alias cleanup_node="fd -u node_modules --prune -x rm -rf"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# URL-decode/encode strings
alias urldecode='python -c "import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1]));"'
alias urlencode='python -c "import sys, urllib.parse; print(urllib.parse.quote_plus(sys.argv[1]));"'

# Merge PDF files, preserving hyperlinks
# Usage: `mergepdf input{1,2,3}.pdf`
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'