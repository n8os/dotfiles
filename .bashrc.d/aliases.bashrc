#VS Code wayland fix
alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"

# https://www.redhat.com/sysadmin/your-bashrc-file
# Require confirmation before overwriting target files. This setting keeps me from deleting things I didn't expect to, etc
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Add color, formatting, etc to ls without re-typing a bunch of options every time
alias ll='ls -alhF'
alias ls="ls --color"

# So I don't need to remember the options to tar every time
alias untar='tar xzvf'
alias tarup='tar czvf'

# dotfiles bare repo
alias dots='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
