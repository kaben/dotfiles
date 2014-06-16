dotfiles
========

home directory dotfiles a la [mcous/dotfiles](https://github.com/mcous/dotfiles)

## dotfile usage
to start using these dotfiles, open a terminal and:

1. `$ git clone mcous/dotfiles` (if you have [hub](https://hub.github.com) installed)
2. `$ chmod +x dotfiles/linkdots` 
3. `$ dotfiles/linkdots`

## what linkdots do
the `linkdots` script:

1. finds every file in `dotfiles` and `dotfiles/one-level-down` that isn't the `linkdots` script, and isn't listed in `do_not_link`
2. does the same thing in `~/Dropbox/privatedots` if it exists
3. backs up any matching, non-symlink dotfiles it finds in `~` to `~/dotfiles_old`
4. symlinks the `files` to `~/.files` and the `directory/files` to `~/.directory/files`

