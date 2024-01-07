## Inspired by (but not forked from) [https://github.com/michaeljsmalley/dotfiles](https://github.com/michaeljsmalley/dotfiles)

The install script will:

1. Back up any existing dotfiles in your home directory to `~/dotfiles_old/`
2. Create symlinks to the dotfiles in `~/dotfiles/` in your home directory
3. Check to see if `zsh` is installed, if it isn't, try to install it.
4. If zsh is installed, run a `chsh -s` to set it as the default shell.

## Installation

```bash
git clone git://github.com/conceptblend/dotfiles ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
```
