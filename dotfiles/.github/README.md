# Dotfiles

This is a bare repository used for versioning dotfiles.

TODO: restructure as central repo with multiple OS dotfiles

1. Create a bare git repo: `git init --bare`
2. Create an alias `dots` referencing the bare repo: `alias dots='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`
3. Don't display untracked files in the repo: `dots config --local status.showUntrackedFiles no`
4. Add files as needed: `dots add /path/to/file`
5. Commit, push, profit: `dots commit -m 'Added the bits and bytes' && dots push && echo 'you profited'`
