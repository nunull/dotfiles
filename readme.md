# dotfiles

Clone this repo to `~/dotfiles` and run `scripts/install.sh`. Files will be symlinked into `~` and old files will be backed up in `dotfiles.old`.

Install `fish` (on OS X run `brew install fish`) and `chsh -s fish`.

The `vimrc` uses [Vundle](https://github.com/VundleVim/Vundle.vim). Don't forget to run `:PluginInstall`.

# Functions

## `cur`

The `cur` function will open `~/notes/cur.md` in `vim`. I use this to keep track on current ToDos.

## `show_hidden`

The `show_hidden` function will show or hide hidden files in the Finder in OS X. Usage `show_hidden YES` or `show_hidden NO`.

## `timer`

The `timer` script can be used to collect working hours on projects. Use `timer <projectname>` when you start working on a project and `^C` when you stop. `timer` shows an overview of all working hours on startup. You can use `timer rm <projectname>` to remove a project. Make sure to backup your `times` file from time to time.
