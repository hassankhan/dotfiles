source ~/.profile

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Load thefuck
eval $(thefuck --alias)

# Added by Toolbox App
export PATH="$PATH:/Users/hassankhan/Library/Application Support/JetBrains/Toolbox/scripts"