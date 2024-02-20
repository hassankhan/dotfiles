# Hassan's dotfiles

## Installation

> **Warning:** If you want to give these dotfiles a try, you should first fork
> this repository, review the code, and remove things you don’t want or need.
> Don't blindly use my settings unless you know what that entails.
>
> **Use at your own risk!**

You can clone the repository wherever you want (I like to keep it in `~/Projects/dotfiles`).

```bash
git clone https://github.com/hassankhan/dotfiles.git && cd dotfiles
```

After cloning, run `bootstrap.sh`

## Notes

### iTerm

#### Shell integration with `fish`

After installing via Homebrew, open iTerm and install the shell integration
from the menu **iTerm2 > Install Shell Integration**.

After installation completes, move the contents of `~/.iterm2` to
`~/.local/bin` and remove `~/.iterm2_shell_integration.fish`.