# Two-line prompt: ┌─ [time] [user@host] [path]
#                   └─ [status: green $ or red $]
export PS1='\[\e[38;5;244m\]┌─ \t \[\e[38;5;214m\]\u\[\e[38;5;244m\]@\[\e[38;5;39m\]\h \[\e[38;5;40m\]\w\n\[\e[38;5;244m\]└─ $(if [ $? -eq 0 ]; then echo "\[\e[32m\]"; else echo "\[\e[31m\]"; fi)\$ \[\e[0m\]'

# Two-line prompt with status symbol: ┌─[✔/✘] [time] [user@host] [path]
#                                       └─ [$]
# export PS1='\[\e[38;5;244m\]┌─$(if [ $? -eq 0 ]; then echo "\[\e[32m\]✔"; else echo "\[\e[31m\]✘"; fi) \[\e[38;5;244m\]\t \[\e[38;5;214m\]\u\[\e[38;5;244m\]@\[\e[38;5;39m\]\h \[\e[38;5;40m\]\w\n\[\e[38;5;244m\]└─\[\e[38;5;196m\]\$ \[\e[0m\]'

# Two-line prompt: ┌── [time] [user@host] [path]
#                   └─ [$]
# export PS1='\[\e[38;5;244m\]┌── \t \[\e[38;5;214m\]\u\[\e[38;5;244m\]@\[\e[38;5;39m\]\h \[\e[38;5;40m\]\w\n\[\e[38;5;244m\]└─\[\e[38;5;196m\]\$\[\e[0m\] '

# Single-line prompt: [time] [path] [colored triple arrows] 
# export PS1='\[\e[38;5;244m\][\[\e[38;5;75m\]\t\[\e[38;5;244m\]] \[\e[38;5;40m\]\w \[\e[38;5;208m\]❯\[\e[38;5;190m\]❯\[\e[38;5;118m\]❯ \[\e[0m\]'

# Single-line prompt: [time] [path] [status: green ✔ or red ✘] [$]
# export PS1='\[\e[38;5;244m\]\t \[\e[38;5;40m\]\w \[\e[0m\]$(if [ $? -eq 0 ]; then echo "\[\e[32m\]✔"; else echo "\[\e[31m\]✘"; fi) \[\e[38;5;244m\]\$ \[\e[0m\]'

# Minimal prompt: [time] [path] [$]
# export PS1='\[\e[38;5;244m\]\t\[\e[0m\] \[\e[38;5;40m\]\w\[\e[38;5;244m\]\$\[\e[0m\] '
