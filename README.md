# My dotfiles

This is my new `.dotfiles` repo.
The old repo, `dothome`, is being phased out.


# Initializing a new machine

First, [install chezmoi](https://www.chezmoi.io/install/). This 1-liner often works (on linux-ish systems, anyway):

    sh -c "$(curl -fsLS get.chezmoi.io)"

Next, initialize it and apply:

    # Shorthand (as I have a github repo called "dotfiles")
    chezmoi init dswisher

    # The more complete
    chezmoi init https://github.com/dswisher/dotfiles.git

This will give you a git repo in `.local/share/chezmoi`, that was checked out with https.
You may want to switch that to ssh, so that you can commit changes:

    git remote set-url origin git@github.com:dswisher/dotfiles.git

You can run `chezmoi diff` to see what it will change, but if this is a new machine, you can just go ahead and do:

    chezmoi apply

You should now have all the needed configs, but you may need to restart your shell.

TODO: Need a "manifest" or something to list programs that need to be installed.

